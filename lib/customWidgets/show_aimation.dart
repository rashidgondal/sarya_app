import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/authentication/signin/models/signin_request_model.dart';
import 'package:sarya/authentication/signup/model/signup_request.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../navigation/navigation_service.dart';
import '../authentication/signin/signin_view_model/signin_cubits.dart';

class ShowAnimation extends StatefulWidget {
  final SignInRequest signInRequest;
  const ShowAnimation({Key? key, required this.signInRequest}) : super(key: key);

  @override
  State<ShowAnimation> createState() => _ShowAnimationState();
}

class _ShowAnimationState extends State<ShowAnimation> {


  late NavigationService _navigationService;
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));

    _controllerCenter.play();

    Future.delayed(const Duration(seconds: 6),(){
      context
          .read<SignInCubits>()
          .doSignIn(signInRequest: widget.signInRequest, navigationService: _navigationService);


    });

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,

      child: SafeArea(

        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 60,
            //leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,), onPressed: () {  },),
           automaticallyImplyLeading: false,
            backgroundColor: AppColor.aquaCasper2,
            title: const Text("Success", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
            centerTitle: true,


          ),

          body:  Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: size.height *0.300,
                  child: SvgPicture.asset('signup_completed'.svg),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality
                      .explosive, // don't specify a direction, blast randomly
                  shouldLoop:
                  true, // start again as soon as the animation is finished
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ], // manually specify the colors to be used
                  createParticlePath: drawStar, // define a custom shape/path.
                ),
              ),            ],
          ),

        ),
      ),
    );
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }


  @override
  void dispose() {
    super.dispose();
    _controllerCenter.dispose();
  }
}
