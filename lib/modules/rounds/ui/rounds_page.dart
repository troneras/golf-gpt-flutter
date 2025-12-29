import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/round.dart';
import 'package:apparence_kit/modules/rounds/providers/rounds_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RoundsPage extends ConsumerWidget {
  const RoundsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context).rounds;
    final state = ref.watch(roundsPageProvider);

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Text(tr.title),
        backgroundColor: context.colors.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => _ErrorView(
            message: tr.error_loading,
            onRetry: () => ref.read(roundsPageProvider.notifier).refresh(),
          ),
          data: (data) {
            if (data.rounds.isEmpty) {
              return _EmptyView(tr: tr);
            }
            return RefreshIndicator(
              onRefresh: () => ref.read(roundsPageProvider.notifier).refresh(),
              child: _RoundsList(
                rounds: data.rounds,
                hasMore: data.hasMore,
                isLoadingMore: data.isLoadingMore,
                onLoadMore: () => ref.read(roundsPageProvider.notifier).loadMore(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  final TranslationsRoundsEs tr;

  const _EmptyView({required this.tr});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.golf_course,
              size: 80,
              color: context.colors.onBackground.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 24),
            Text(
              tr.empty,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.onBackground.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              tr.empty_hint,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onBackground.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: context.colors.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: Text(Translations.of(context).common.retry),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundsList extends StatelessWidget {
  final List<Round> rounds;
  final bool hasMore;
  final bool isLoadingMore;
  final VoidCallback onLoadMore;

  const _RoundsList({
    required this.rounds,
    required this.hasMore,
    required this.isLoadingMore,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.extentAfter < 200 &&
            hasMore &&
            !isLoadingMore) {
          onLoadMore();
        }
        return false;
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: rounds.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == rounds.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return _RoundCard(round: rounds[index]);
        },
      ),
    );
  }
}

class _RoundCard extends StatelessWidget {
  final Round round;

  const _RoundCard({required this.round});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd(Localizations.localeOf(context).toString());

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: context.colors.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.push('/round-detail/${round.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          round.course.name,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dateFormat.format(round.startTime),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _ScoreBadge(round: round),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  if (round.totalStrokes != null) ...[
                    _StatChip(
                      icon: Icons.sports_golf,
                      value: round.totalStrokes.toString(),
                    ),
                    const SizedBox(width: 16),
                  ],
                  if (round.totalPutts != null) ...[
                    _StatChip(
                      icon: Icons.golf_course,
                      value: '${round.totalPutts} putts',
                    ),
                    const SizedBox(width: 16),
                  ],
                  if (round.durationMinutes != null)
                    _StatChip(
                      icon: Icons.timer_outlined,
                      value: _formatDuration(round.durationMinutes!),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0) {
      return '${hours}h ${mins}m';
    }
    return '${mins}m';
  }
}

class _ScoreBadge extends StatelessWidget {
  final Round round;

  const _ScoreBadge({required this.round});

  @override
  Widget build(BuildContext context) {
    // Use stored scoreRelativeToPar for finished rounds (scores array not loaded in list view)
    final relativeToPar = round.scoreRelativeToPar;
    final hasScore = relativeToPar != null || round.totalStrokes != null;

    Color backgroundColor;
    Color textColor;

    if (relativeToPar != null && relativeToPar < 0) {
      backgroundColor = const Color(0xFF4CAF50).withValues(alpha: 0.15);
      textColor = const Color(0xFF2E7D32);
    } else if (relativeToPar != null && relativeToPar > 0) {
      backgroundColor = const Color(0xFFFF9800).withValues(alpha: 0.15);
      textColor = const Color(0xFFE65100);
    } else {
      backgroundColor = context.colors.primary.withValues(alpha: 0.15);
      textColor = context.colors.primary;
    }

    String scoreText;
    if (!hasScore) {
      scoreText = '-';
    } else if (relativeToPar == null) {
      // Has strokes but no relative to par calculated
      scoreText = round.totalStrokes.toString();
    } else if (relativeToPar == 0) {
      scoreText = 'E';
    } else if (relativeToPar > 0) {
      scoreText = '+$relativeToPar';
    } else {
      scoreText = '$relativeToPar';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        scoreText,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String value;

  const _StatChip({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: context.colors.onSurface.withValues(alpha: 0.5),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
