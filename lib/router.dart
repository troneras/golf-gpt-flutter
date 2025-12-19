import 'package:apparence_kit/core/bottom_menu/bottom_menu.dart';
import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/guards/authenticated_guard.dart';
import 'package:apparence_kit/core/guards/user_info_guard.dart';
import 'package:apparence_kit/core/widgets/page_not_found.dart';
import 'package:apparence_kit/modules/authentication/ui/email_verification_page.dart';
import 'package:apparence_kit/modules/authentication/ui/phone_auth_page.dart';
import 'package:apparence_kit/modules/authentication/ui/recover_password_page.dart';
import 'package:apparence_kit/modules/authentication/ui/signin_page.dart';
import 'package:apparence_kit/modules/authentication/ui/signup_page.dart';
import 'package:apparence_kit/modules/feedback/ui/feedback_page.dart';
import 'package:apparence_kit/modules/round/ui/browse_courses_page.dart';
import 'package:apparence_kit/modules/round/ui/round_in_progress_page.dart';
import 'package:apparence_kit/modules/round/ui/round_summary_page.dart';
import 'package:apparence_kit/modules/round/ui/select_course_page.dart';
import 'package:apparence_kit/modules/round/domain/running_score.dart';
import 'package:apparence_kit/modules/rounds/ui/round_detail_page.dart';

import 'package:apparence_kit/modules/onboarding/ui/onboarding_page.dart';
import 'package:apparence_kit/modules/onboarding/ui/complete_page.dart';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) => generateRouter(),
);

extension GoRouterRiverpod on Ref {
  GoRouter get goRouter => read(goRouterProvider);
}

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter generateRouter({
  String? initialLocation,
  List<GoRoute>? additionalRoutes,
  List<NavigatorObserver>? observers,
}) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    errorBuilder: (context, state) => const PageNotFound(),
    observers: [
      AnalyticsObserver(
        analyticsApi: MixpanelAnalyticsApi.instance(),
      ),
      
      ...?observers,
    ],
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const UserInfosGuard(
          fallbackRoute: '/onboarding',
          child: BottomMenu(),
        ),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        name: 'signin',
        path: '/signin',
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        name: 'signinWithPhone',
        path: '/signinWithPhone',
        builder: (context, state) => const PhoneAuthPage(),
      ),
      GoRoute(
        name: 'email_verification',
        path: '/email_verification',
        builder: (context, state) => const EmailVerificationPage(),
      ),
      GoRoute(
        name: 'recover_password',
        path: '/recover_password',
        builder: (context, state) => const RecoverPasswordPage(),
      ),
      GoRoute(
        name: 'complete',
        path: '/complete',
        builder: (context, state) => const CompletePage(),
      ),
      GoRoute(
        name: 'feedback',
        path: '/feedback',
        builder: (context, state) => const FeedbackPage(),
      ),
      GoRoute(
        name: 'select_course',
        path: '/select-course',
        builder: (context, state) => const SelectCoursePage(),
      ),
      GoRoute(
        name: 'browse_courses',
        path: '/browse-courses',
        builder: (context, state) => const BrowseCoursesPage(),
      ),
      GoRoute(
        name: 'round_in_progress',
        path: '/round-in-progress',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final roundId = extra?['roundId'] as String?;
          return RoundInProgressPage(roundId: roundId);
        },
      ),
      GoRoute(
        name: 'round_summary',
        path: '/round-summary',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final roundId = extra?['roundId'] as String? ?? '';
          final summary = extra?['summary'] as RoundSummary? ?? const RoundSummary();
          return RoundSummaryPage(roundId: roundId, summary: summary);
        },
      ),
      GoRoute(
        name: 'round_detail',
        path: '/round-detail/:id',
        builder: (context, state) {
          final roundId = state.pathParameters['id'] ?? '';
          return RoundDetailPage(roundId: roundId);
        },
      ),
      GoRoute(
        name: '404',
        path: '/404',
        builder: (context, state) => const PageNotFound(),
      ),
    ],
  );
}

