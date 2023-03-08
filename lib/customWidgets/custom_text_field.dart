import 'package:flutter/material.dart';

import '../theme/color_scheme.dart';

class CustomTextField extends StatefulWidget {
  final int maxLine;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final String hintText;
  final Size size;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextInputAction? textInputAction;
  final Function(String)? onChange;
  const CustomTextField({Key? key,
    required this.maxLine,
    required this.textEditingController,
    required this.size,
    required this.textInputType,
    required this.hintText,
    this.textInputAction,
    this.icon,
    this.onChange,
    this.suffixIcon,
    this.prefix
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.maxLine == 1 ? 80.0 : 120,
          width: widget.size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    height: widget.maxLine == 1 ? 54.0 : 100,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: AppColor.borderColor2, width: 1)),
                    child: Center(
                      child: TextFormField(
                        minLines: 1,
                        maxLines:widget.maxLine,
                        keyboardType: widget.textInputType,
                        onChanged: widget.onChange,
                        controller: widget.textEditingController,
                        textInputAction: widget.textInputAction,
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: widget.hintText,
                            hintStyle: const TextStyle(
                                fontSize: 15.0, color: AppColor.headingColor2),
                            suffixIcon: widget.suffixIcon
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: widget.maxLine == 1 ? 57 : 100,
          left: 20,
          child: Container(
            color: AppColor.whiteColor,
            height: 20,
            child: Row(
              children: [
                widget.icon == null? SizedBox(): widget.icon!,
                SizedBox(width: 5,),
               Container(
                  color: AppColor.whiteColor,
                  child: widget.prefix,
                ),
              ],
            )
          ),
        ),
      ],
    );
  }


}
