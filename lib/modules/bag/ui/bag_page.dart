import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/bag/domain/club.dart';
import 'package:apparence_kit/modules/bag/providers/bag_page_notifier.dart';
import 'package:apparence_kit/modules/bag/ui/widgets/club_card.dart';
import 'package:apparence_kit/modules/bag/ui/widgets/club_edit_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BagPage extends ConsumerWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bagPageProvider);
    final tr = Translations.of(context).bag;

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          tr.title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ErrorView(
          error: error.toString(),
          onRetry: () => ref.read(bagPageProvider.notifier).refresh(),
        ),
        data: (data) => _BagContent(
          clubs: data.clubs,
          isSaving: data.isSaving,
          onClubTap: (club) => _openEditSheet(context, ref, club, data.clubs),
          onClubDelete: (club) => _confirmDelete(context, ref, club),
          onAddClub: () => _openAddSheet(context, ref, data.clubs),
        ),
      ),
      floatingActionButton: state.hasValue
          ? FloatingActionButton(
              onPressed: () => _openAddSheet(context, ref, state.value!.clubs),
              backgroundColor: context.colors.primary,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }

  void _openEditSheet(
    BuildContext context,
    WidgetRef ref,
    Club club,
    List<Club> clubs,
  ) {
    ClubEditSheet.show(
      context: context,
      club: club,
      existingClubTypes: clubs.map((c) => c.clubType).toList(),
      onSave: ({required clubType, distanceYards}) {
        if (distanceYards != null) {
          ref.read(bagPageProvider.notifier).updateClubDistance(
                clubId: club.id,
                distanceYards: distanceYards,
              );
        }
      },
    );
  }

  void _openAddSheet(
    BuildContext context,
    WidgetRef ref,
    List<Club> clubs,
  ) {
    ClubEditSheet.show(
      context: context,
      existingClubTypes: clubs.map((c) => c.clubType).toList(),
      onSave: ({required clubType, distanceYards}) {
        ref.read(bagPageProvider.notifier).addClub(
              clubType: clubType,
              distanceYards: distanceYards,
            );
      },
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Club club) {
    final tr = Translations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr.bag.delete_club),
        content: Text(tr.bag.delete_confirm(clubName: club.displayName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(tr.common.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(bagPageProvider.notifier).deleteClub(club.id);
            },
            child: Text(
              tr.bag.delete_club,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}

class _BagContent extends StatelessWidget {
  final List<Club> clubs;
  final bool isSaving;
  final void Function(Club) onClubTap;
  final void Function(Club) onClubDelete;
  final VoidCallback onAddClub;

  const _BagContent({
    required this.clubs,
    required this.isSaving,
    required this.onClubTap,
    required this.onClubDelete,
    required this.onAddClub,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).bag;

    if (clubs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.golf_course,
              size: 64,
              color: context.colors.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              tr.empty,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: onAddClub,
              child: Text(tr.add_club),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 8, bottom: 80),
          itemCount: clubs.length,
          itemBuilder: (context, index) {
            final club = clubs[index];
            return ClubCard(
              club: club,
              onTap: () => onClubTap(club),
              onDelete: () => onClubDelete(club),
            );
          },
        ),
        if (isSaving)
          Positioned.fill(
            child: Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: context.colors.error,
            ),
            const SizedBox(height: 16),
            Text(
              tr.bag.error_loading,
              style: context.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: Text(tr.common.retry),
            ),
          ],
        ),
      ),
    );
  }
}
