import 'package:flutter/material.dart';

import 'Sarya_color.dart';

/// Custom Search Field
class SaryaSearchField extends StatefulWidget {
  /// Custom Search Field
  SaryaSearchField({
    Key? key,
    this.backgroundColor = SaryaColors.appbar,
    this.onFocus,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  /// Background color for [SaryaSearchField]
  final Color? backgroundColor;

  /// onChanged callback for [SaryaSearchField]
  final ValueChanged<String> onChanged;

  /// onFocus callback for [SaryaSearchField]
  final VoidCallback? onFocus;

  /// TextEditingController for [SaryaSearchField]
  late TextEditingController? controller;

  @override
  State<SaryaSearchField> createState() => _SaryaSearchFieldState();
}

class _SaryaSearchFieldState extends State<SaryaSearchField> {
  @override
  void initState() {
    widget.controller ??= TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: const TextStyle(
          color: SaryaColors.secondaryText,
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: widget.backgroundColor,
      ),
      textCapitalization: TextCapitalization.sentences,
      cursorColor: SaryaColors.primary,
      onChanged: widget.onChanged,
      onTap: widget.onFocus,
    );
  }

  @override
  void dispose() {
    widget.controller?.clear();
    super.dispose();
  }
}
