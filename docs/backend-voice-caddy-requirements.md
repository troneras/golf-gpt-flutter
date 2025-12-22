# Voice Caddy Backend Requirements

## Overview

This document specifies the backend requirements to support the Voice Caddy connection flow in the TalkCaddy mobile app. The flow enables users to connect their TalkCaddy account with the ChatGPT CustomGPT voice caddy.

### Context

- **Existing**: OAuth flow between ChatGPT CustomGPT and TalkCaddy backend
- **New**: Status tracking endpoints for the mobile app to detect connection state
- **Architecture**: The CustomGPT authenticates via OAuth; the mobile app polls for connection status

```
┌─────────────────┐      OAuth      ┌─────────────────┐
│  ChatGPT GPT    │ ◄─────────────► │  TalkCaddy API  │
│  (Voice Caddy)  │                 │    (Backend)    │
└─────────────────┘                 └────────┬────────┘
                                             │
                                    REST API │
                                             │
                                    ┌────────▼────────┐
                                    │  TalkCaddy App  │
                                    │   (Flutter)     │
                                    └─────────────────┘
```

---

## API Endpoints

### 1. Get GPT Connection Status

Returns the current OAuth connection status for a user.

```
GET /users/{user_id}/gpt-connection
```

**Path Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| user_id | string (UUID) | The authenticated user's ID |

**Headers:**
```
Authorization: Bearer <access_token>
```

**Response 200 OK:**
```json
{
  "has_completed_oauth": true,
  "last_interaction": "2024-12-22T14:30:00Z"
}
```

**Response Fields:**
| Field | Type | Nullable | Description |
|-------|------|----------|-------------|
| has_completed_oauth | boolean | No | Whether user has completed OAuth with ChatGPT CustomGPT |
| last_interaction | ISO 8601 datetime | Yes | Timestamp of last interaction via the CustomGPT (null if never used) |

**Response 404 Not Found:**
Return when user has no GPT connection record (treat as not connected):
```json
{
  "has_completed_oauth": false,
  "last_interaction": null
}
```

**Response 401 Unauthorized:**
```json
{
  "error": "unauthorized",
  "message": "Invalid or expired token"
}
```

**Notes:**
- The mobile app polls this endpoint every 3 seconds during the connection flow
- Should be lightweight and fast (< 100ms response time)
- Consider caching if under heavy load

---

### 2. Refresh GPT Connection Status (Optional)

Force a refresh of the connection status. Useful if there's eventual consistency in the OAuth state.

```
POST /users/{user_id}/gpt-connection/check
```

**Path Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| user_id | string (UUID) | The authenticated user's ID |

**Headers:**
```
Authorization: Bearer <access_token>
```

**Response 200 OK:**
```json
{
  "has_completed_oauth": true,
  "last_interaction": "2024-12-22T14:30:00Z"
}
```

**Notes:**
- This endpoint can perform additional validation (e.g., check if OAuth token is still valid)
- Response format identical to GET endpoint
- Used when user taps "I've connected" button manually

---

## Data Model

### GPT Connection Record

Store OAuth connection state per user:

```sql
CREATE TABLE user_gpt_connections (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    has_completed_oauth BOOLEAN NOT NULL DEFAULT FALSE,
    oauth_access_token TEXT,                    -- Encrypted
    oauth_refresh_token TEXT,                   -- Encrypted
    oauth_token_expires_at TIMESTAMP WITH TIME ZONE,
    last_interaction TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    UNIQUE(user_id)
);

CREATE INDEX idx_user_gpt_connections_user_id ON user_gpt_connections(user_id);
```

**Field Descriptions:**
| Field | Description |
|-------|-------------|
| user_id | Foreign key to users table |
| has_completed_oauth | Set to true when OAuth flow completes successfully |
| oauth_access_token | Encrypted access token for CustomGPT API calls |
| oauth_refresh_token | Encrypted refresh token for token renewal |
| oauth_token_expires_at | When the access token expires |
| last_interaction | Updated each time CustomGPT makes an API call for this user |

---

## OAuth Flow Integration

### Existing OAuth Flow (CustomGPT → Backend)

When user authenticates via ChatGPT CustomGPT:

1. CustomGPT redirects to TalkCaddy OAuth authorization endpoint
2. User authenticates with TalkCaddy credentials
3. Backend issues OAuth tokens to CustomGPT
4. **NEW**: Backend sets `has_completed_oauth = true` for the user

### Required Modification

In the OAuth token issuance handler, add:

```python
# After successfully issuing OAuth tokens
def on_oauth_complete(user_id: str, tokens: OAuthTokens):
    # Existing: Store tokens for CustomGPT
    store_oauth_tokens(user_id, tokens)

    # NEW: Mark connection as complete
    upsert_gpt_connection(
        user_id=user_id,
        has_completed_oauth=True,
        oauth_access_token=tokens.access_token,
        oauth_refresh_token=tokens.refresh_token,
        oauth_token_expires_at=tokens.expires_at
    )
```

### Update Last Interaction

When the CustomGPT makes any API call on behalf of a user:

```python
# In middleware or request handler
def on_gpt_api_call(user_id: str):
    update_last_interaction(user_id, datetime.utcnow())
```

---

## Mobile App Behavior

### Polling Strategy

The mobile app polls `GET /users/{id}/gpt-connection` with:
- **Interval**: 3 seconds
- **Max Duration**: 5 minutes (100 requests max)
- **Stop Conditions**:
  - `has_completed_oauth` becomes `true`
  - User navigates away
  - Max duration reached

### Expected Flow

```
1. User opens Voice Caddy setup in app
2. App shows "Connect" screen
3. User taps "Open TalkCaddy in ChatGPT"
4. App opens ChatGPT via deep link
5. App navigates to "Waiting" screen
6. App starts polling GET /users/{id}/gpt-connection
7. User completes OAuth in ChatGPT
8. Backend sets has_completed_oauth = true
9. App receives has_completed_oauth = true in poll response
10. App navigates to "Success" screen
```

### Fallback

If polling times out (5 minutes), user can:
- Tap "I've connected" → triggers `POST /users/{id}/gpt-connection/check`
- Retry the flow
- Skip and continue without voice caddy

---

## Security Considerations

### Authentication

- All endpoints require valid JWT bearer token
- User can only access their own connection status (`user_id` must match token subject)

### Token Storage

- OAuth tokens for CustomGPT should be encrypted at rest
- Use separate encryption keys from user passwords
- Consider using a secrets manager (AWS Secrets Manager, HashiCorp Vault)

### Rate Limiting

- Apply rate limiting to prevent abuse during polling
- Suggested: 20 requests/minute per user for GET endpoint
- Suggested: 5 requests/minute per user for POST endpoint

### CORS

- Endpoints should not allow browser CORS (mobile app only)
- If web admin needed, use separate endpoints

---

## Error Handling

### Standard Error Response Format

```json
{
  "error": "error_code",
  "message": "Human readable message"
}
```

### Error Codes

| HTTP Status | Error Code | Description |
|-------------|------------|-------------|
| 400 | invalid_request | Malformed request |
| 401 | unauthorized | Invalid or missing token |
| 403 | forbidden | User cannot access this resource |
| 404 | not_found | User or connection not found |
| 429 | rate_limited | Too many requests |
| 500 | internal_error | Server error |

---

## Testing Requirements

### Unit Tests

- [ ] GET endpoint returns correct status for connected user
- [ ] GET endpoint returns `false` for user with no connection record
- [ ] POST endpoint triggers status refresh
- [ ] OAuth completion handler updates `has_completed_oauth`
- [ ] Last interaction updates on CustomGPT API calls

### Integration Tests

- [ ] Full OAuth flow sets connection status correctly
- [ ] Mobile app can poll and detect connection
- [ ] Token refresh works when access token expires
- [ ] Rate limiting prevents abuse

### Load Tests

- [ ] GET endpoint handles 1000 concurrent polling users
- [ ] Response time < 100ms under load

---

## Implementation Checklist

### Database
- [ ] Create `user_gpt_connections` table
- [ ] Add indexes for user_id lookup
- [ ] Set up encryption for token storage

### API Endpoints
- [ ] Implement `GET /users/{id}/gpt-connection`
- [ ] Implement `POST /users/{id}/gpt-connection/check` (optional)
- [ ] Add authentication middleware
- [ ] Add rate limiting

### OAuth Integration
- [ ] Modify OAuth completion handler to set `has_completed_oauth`
- [ ] Add middleware to update `last_interaction` on CustomGPT calls

### Monitoring
- [ ] Add logging for connection status changes
- [ ] Add metrics for polling frequency
- [ ] Alert on high error rates

---

## Appendix: Mobile App Code Reference

### API Client (Flutter)

```dart
// lib/modules/voice_caddy/api/voice_caddy_api.dart

class VoiceCaddyApi {
  Future<GptConnectionEntity> checkConnectionStatus(String userId) async {
    final response = await _client
        .from('user_gpt_connections')
        .select('has_completed_oauth, last_interaction')
        .eq('user_id', userId)
        .maybeSingle();

    if (response == null) {
      return const GptConnectionEntity(
        hasCompletedOauth: false,
        lastInteraction: null,
      );
    }
    return GptConnectionEntity.fromJson(response);
  }
}
```

### State Model (Flutter)

```dart
// lib/modules/voice_caddy/providers/models/voice_caddy_state.dart

@freezed
sealed class VoiceCaddyState with _$VoiceCaddyState {
  const factory VoiceCaddyState({
    @Default(false) bool isConnected,
    @Default(false) bool isChecking,
    @Default(false) bool isPolling,
    @Default(false) bool hasSkippedFlow,
    @Default(false) bool hasCompletedFlow,
    DateTime? lastInteraction,
    String? error,
  }) = _VoiceCaddyState;
}
```

---

## Questions for Backend Team

1. **Existing OAuth tables**: What's the current schema for storing OAuth tokens from the CustomGPT?
2. **Token validation**: Should `POST /check` validate that OAuth tokens are still valid with OpenAI?
3. **Supabase**: Is the backend using Supabase? If so, this can leverage Row Level Security (RLS).
4. **Webhook**: Would it be useful to have a webhook when connection status changes (for push notifications)?
