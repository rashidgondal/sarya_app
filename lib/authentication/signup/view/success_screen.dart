import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/authentication/signup/model/signup_request.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../navigation/navigation_service.dart';
import '../signup_view_model/signup_cubits.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late NavigationService _navigationService;
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    _navigationService = locator<NavigationService>();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
    _navigationService = locator<NavigationService>();
    Future.delayed(Duration(milliseconds: 300), () {
      left_offset = 130;
      setState(() {});
      Future.delayed(Duration(seconds: 1), () {
        _controllerCenter.play();
        setState(() {});
      });
    });
  }

  double left_offset = 3;

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
            title: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height * 0.300,
                    child: SvgPicture.asset('sucsess_screen'.svg),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Hooray!",
                        style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.w700,
                            color: AppColor.colorBlue),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "You are done, now lets customize \n your avatar.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: AppColor.aquaCasper),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      InkWell(
                        onTap: () {
                          _navigationService.navigateTo(avatarRout);
                        },
                        child: Container(
                          height: 46.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              color: AppColor.buttonColor,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: const Center(
                            child: Text(
                              "Customize Avatar",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          SignupRequest req =
                              context.read<SignupCubits>().getSignupRequest;

                          context.read<SignupCubits>().doSignup(
                              signupRequest: req,
                              navigationService: _navigationService);
                        },
                        child: Container(
                          height: 46.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: const Center(
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.colorBlack),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              AnimatedPositioned(
                  top: 55,
                  left: left_offset,
                  child: Container(
                    height: size.height * 0.300,
                    child: SvgPicture.asset('turtle'.svg),
                  ),
                  duration: Duration(seconds: 1)),
              Positioned(
                top: 0,
                left: size.width/2-100,
                child: ConfettiWidget(
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality
                      .explosive,
                  blastDirection: pi,
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
              ),
            ],
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
}
