import 'package:flutter/material.dart';
import 'package:sarya/search_places/sarya_text.dart';

import 'Sarya_color.dart';

/// Chip widget for sarya_ui
class SaryaChip extends StatelessWidget {
  /// Chip widget for sarya_ui
  const SaryaChip({
    Key? key,
    required this.label,
    this.onDeleted,
    this.isEnabled = true,
  }) : super(key: key);

  /// label for [SaryaChip]
  final String label;
  final VoidCallback? onDeleted;

  /// isEnabled for [SaryaChip]
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      isEnabled: isEnabled,
      backgroundColor: SaryaColors.green40,
      disabledColor: SaryaColors.green40,
      label: SaryaText(
        text: label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: SaryaColors.primaryText,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      onSelected: (value) {},
      deleteIcon: const Icon(
        Icons.close_rounded,
        size: 18.0,
        color: SaryaColors.primaryText,
      ),
      onDeleted: onDeleted,
    );
  }
}
