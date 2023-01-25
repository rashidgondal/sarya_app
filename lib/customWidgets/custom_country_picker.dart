import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';


class CustomCountryPicker extends StatelessWidget {

  final dynamic value;
  final Widget? icon;
  final String hint;
  final String errorText;
  final List<DropdownMenuItem<dynamic>> items;
  final Function onItemChanged;
  final EdgeInsets contentPadding;
  final double borderRadius;
  final Color borderColor;
  final String disabledHint;

  const CustomCountryPicker({
    Key? key,
    required this.value,
     this.icon,
    required this.hint,
    required this.items,
    required this.onItemChanged,
    required this.errorText,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.borderRadius = 30,
    this.borderColor = Colors.grey,
    this.disabledHint = 'Loading...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(

      value: value,

      disabledHint: Text(disabledHint),
      hint: Row(
        children: [
          icon ==  null? const SizedBox.shrink(): icon!,
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              hint,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:const TextStyle(
                color: AppColor.colorGrey,
              ),
            ),
          ),
        ],
      ),
      items: items,
      onChanged: (item) {
        onItemChanged(item);
      },
      isExpanded: true,
      underline:const SizedBox.shrink(),
      icon: const Icon(Icons.keyboard_arrow_down),
    );
  }
}
