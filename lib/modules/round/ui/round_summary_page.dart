import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/modules/round/domain/running_score.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              // Success icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.green.shade400,
                      Colors.green.shade600,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.check,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Ronda finalizada!',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Aqui esta tu resumen',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 32),
              // Score card
              _ScoreCard(summary: summary),
              const SizedBox(height: 24),
              // Stats grid
              _StatsGrid(summary: summary),
              const SizedBox(height: 32),
              // Action buttons
              SizedBox(
                width: double.infinity,
                height: 52,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF8BC34A),
                        Color(0xFF689F38),
                      ],
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => context.go('/'),
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          'Volver al inicio',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  context.push('/round-detail/$roundId');
                },
                child: Text(
                  'Ver detalles',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w600,
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
    final isUnderPar = summary.relativeToPar < 0;
    final isOverPar = summary.relativeToPar > 0;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            isUnderPar
                ? Colors.green.shade50
                : isOverPar
                    ? Colors.red.shade50
                    : Colors.grey.shade100,
            isUnderPar
                ? Colors.green.shade100
                : isOverPar
                    ? Colors.red.shade100
                    : Colors.grey.shade200,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isUnderPar
              ? Colors.green.shade200
              : isOverPar
                  ? Colors.red.shade200
                  : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${summary.totalStrokes}',
                style: context.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.onSurface,
                  height: 1,
                ),
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isUnderPar
                        ? Colors.green.shade600
                        : isOverPar
                            ? Colors.red.shade600
                            : Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    summary.relativeToParFormatted,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'golpes totales',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.6),
            ),
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
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.golf_course,
                label: 'Putts',
                value: '${summary.totalPutts}',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.timer_outlined,
                label: 'Duracion',
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
                label: 'Fairways',
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
                label: 'GIR',
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: context.colors.onSurface.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    subtitle!,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.primary,
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
