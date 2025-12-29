import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/bag/domain/club.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClubEditSheet extends StatefulWidget {
  final Club? club;
  final List<String> existingClubTypes;
  final void Function({
    required String clubType,
    int? distanceYards,
  }) onSave;

  const ClubEditSheet({
    super.key,
    this.club,
    this.existingClubTypes = const [],
    required this.onSave,
  });

  static Future<void> show({
    required BuildContext context,
    Club? club,
    List<String> existingClubTypes = const [],
    required void Function({
      required String clubType,
      int? distanceYards,
    }) onSave,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ClubEditSheet(
        club: club,
        existingClubTypes: existingClubTypes,
        onSave: onSave,
      ),
    );
  }

  @override
  State<ClubEditSheet> createState() => _ClubEditSheetState();
}

class _ClubEditSheetState extends State<ClubEditSheet> {
  late String? _selectedClubType;
  late TextEditingController _distanceController;

  bool get isEditing => widget.club != null;

  List<ClubTypeOption> get availableClubTypes {
    if (isEditing) return ClubTypes.all;
    return ClubTypes.all
        .where((c) => !widget.existingClubTypes.contains(c.type))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _selectedClubType = widget.club?.clubType ?? availableClubTypes.firstOrNull?.type;
    _distanceController = TextEditingController(
      text: widget.club?.distanceYards?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _distanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).bag;
    final colors = context.colors;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF141A24).withValues(alpha: 0.95),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          border: Border(
            top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
            left: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
            right: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isEditing ? tr.edit_distance : tr.add_club_title,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.onSurface,
                  ),
                ),
                const SizedBox(height: 24),
                if (isEditing)
                  _ReadOnlyClubName(name: widget.club!.displayName)
                else
                  _ClubTypeDropdown(
                    value: _selectedClubType,
                    options: availableClubTypes,
                    hintText: tr.select_club,
                    onChanged: (value) {
                      setState(() => _selectedClubType = value);
                    },
                  ),
                const SizedBox(height: 16),
                _DistanceInput(
                  controller: _distanceController,
                  labelText: tr.distance_label,
                  hintText: tr.distance_hint,
                  suffixText: tr.distance_unit,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: _canSave
                      ? Container(
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: _handleSave,
                              borderRadius: BorderRadius.circular(12),
                              child: Center(
                                child: Text(
                                  tr.save,
                                  style: context.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                          child: Center(
                            child: Text(
                              tr.save,
                              style: context.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withValues(alpha: 0.3),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get _canSave {
    if (_selectedClubType == null) return false;
    return true;
  }

  void _handleSave() {
    if (!_canSave) return;
    HapticFeedback.mediumImpact();
    final distance = int.tryParse(_distanceController.text);
    widget.onSave(
      clubType: _selectedClubType!,
      distanceYards: distance,
    );
    Navigator.of(context).pop();
  }
}

class _ReadOnlyClubName extends StatelessWidget {
  final String name;

  const _ReadOnlyClubName({required this.name});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF141A24).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Text(
        name,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: colors.onSurface,
        ),
      ),
    );
  }
}

class _ClubTypeDropdown extends StatelessWidget {
  final String? value;
  final List<ClubTypeOption> options;
  final String hintText;
  final ValueChanged<String?> onChanged;

  const _ClubTypeDropdown({
    required this.value,
    required this.options,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF141A24).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: const Color(0xFF141A24),
          hint: Text(
            hintText,
            style: context.textTheme.bodyLarge?.copyWith(
              color: colors.onSurface.withValues(alpha: 0.5),
            ),
          ),
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option.type,
              child: Text(
                option.displayName,
                style: TextStyle(color: colors.onSurface),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _DistanceInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String suffixText;

  const _DistanceInput({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(color: colors.onSurface),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.7)),
        hintText: hintText,
        hintStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
        filled: true,
        fillColor: const Color(0xFF141A24).withValues(alpha: 0.85),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.primary.withValues(alpha: 0.6)),
        ),
        suffixText: suffixText,
        suffixStyle: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
      ),
    );
  }
}
