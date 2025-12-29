import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/round/domain/running_score.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Round summary page - "Emotional" screen type per design system.
/// Uses Level 2 glass for cards, primary CTA with glow.
class RoundSummaryPage extends StatelessWidget {
  final String roundId;
  final RoundSummary summary;

  const RoundSummaryPage({
    super.key,
    required this.roundId,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = Translations.of(context).round_summary;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              // Success icon with accent glow
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colors.accent,
                      colors.accentSoft,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colors.accent.withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.check,
                  size: 48,
                  color: colors.onPrimary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                tr.title,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.onBackground,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                tr.subtitle,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              // Score card
              _ScoreCard(summary: summary),
              const SizedBox(height: 24),
              // Stats grid
              _StatsGrid(summary: summary),
              const SizedBox(height: 32),
              // Primary CTA with gradient and glow
              GestureDetector(
                onTap: () => context.go('/'),
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colors.primary.withValues(alpha: 0.9),
                        colors.primary,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colors.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      tr.back_home,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Ghost button for details
              GestureDetector(
                onTap: () => context.push('/round-detail/$roundId'),
                child: Container(
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      tr.view_details,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  final RoundSummary summary;

  const _ScoreCard({required this.summary});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = Translations.of(context).round_summary;
    final isUnderPar = summary.relativeToPar < 0;
    final isOverPar = summary.relativeToPar > 0;

    // Score badge color based on performance (muted per design system)
    final badgeColor = isUnderPar
        ? colors.success
        : isOverPar
            ? colors.error
            : colors.textTertiary;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        // Level 2 Prominent Glass
        color: const Color(0xFF141A24).withValues(alpha: 0.90),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Stack(
        children: [
          // Inset shadow overlay for glass depth
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withValues(alpha: 0.15),
                    Colors.black.withValues(alpha: 0.05),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.3, 0.6],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${summary.totalStrokes}',
                    style: context.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.onBackground,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: badgeColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: badgeColor.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Text(
                        summary.relativeToParFormatted,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: badgeColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                tr.total_strokes,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: colors.textTertiary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  final RoundSummary summary;

  const _StatsGrid({required this.summary});

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).round_summary;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.golf_course,
                label: tr.putts,
                value: '${summary.totalPutts}',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.timer_outlined,
                label: tr.duration,
                value: summary.durationFormatted,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.flag_outlined,
                label: tr.fairways,
                value: summary.fairwaysFormatted,
                subtitle: summary.fairwaysPercentage != null
                    ? '${(summary.fairwaysPercentage! * 100).toStringAsFixed(0)}%'
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.adjust,
                label: tr.gir,
                value: summary.girFormatted,
                subtitle: summary.girPercentage != null
                    ? '${(summary.girPercentage! * 100).toStringAsFixed(0)}%'
                    : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Stat card with Level 1 matte glass styling.
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String? subtitle;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // Level 1 Matte Glass
        color: const Color(0xFF141A24).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: colors.primary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: context.textTheme.bodySmall?.copyWith(
                  color: colors.textTertiary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.onBackground,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    subtitle!,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
