import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

class TextDecoratedContainer extends StatelessWidget {
  final Widget titleWidget;
  final Widget iconImage;
  final Widget? icon;

  const TextDecoratedContainer({Key? key, required this.titleWidget, required  this.iconImage, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          height: 70.0,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: AppColor.borderColor2, width: 1)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleWidget,
                        icon == null? const SizedBox() : icon!
                      ],
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 20,
          child: Container(
              color: AppColor.whiteColor,
              height: 20,
              child:iconImage
          ),
        ),
      ],
    );
  }
}
