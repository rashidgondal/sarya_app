import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sarya/theme/color_scheme.dart';

class DataLoading extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  const DataLoading({Key? key, required this.child, required this.isLoading}) : super(key: key);


  @override
  State<DataLoading> createState() => _DataLoadingState();
}

class _DataLoadingState extends State<DataLoading> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        widget.child,
        false?
        Container(
          width: size.width,
          height: size.height,
          color: AppColor.whiteColor.withOpacity(0.5),
          child:const  Center(
            child: SpinKitWave(
             color: AppColor.lightIndigo,
              size: 50.0,
            ),
          )
        ):const SizedBox()
      ],
    );
  }
}
