import 'package:flutter/material.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../navigation/navigation_service.dart';

class TripSuccessScreen extends StatefulWidget {
  const TripSuccessScreen({Key? key}) : super(key: key);

  @override
  State<TripSuccessScreen> createState() => _TripSuccessScreenState();
}

class _TripSuccessScreenState extends State<TripSuccessScreen> {


  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();

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
            title: const Text("Trip to UAE", style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),),
            centerTitle: true,


          ),

          body: Column(children: [
            Container(
              height: size.height *0.300,
              color: AppColor.aquaGreen,
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const Text("Hooray!", style: TextStyle(fontSize: 38.0 ,fontWeight: FontWeight.w700, color: AppColor.colorBlue),),
                const SizedBox(height: 20.0,),
                const Text("YOUR TRIP HAS BEEN COMPLETED",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0 ,fontWeight: FontWeight.w700, color: AppColor.aquaCasper),),
                const SizedBox(height: 40.0,),
                InkWell(
                  onTap: () {
                    _navigationService.navigateTo(chooseAvatarRout);
                  },
                  child: Container(
                    height: 46.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontSize: 15.0,fontWeight: FontWeight.w500 ,color: AppColor.whiteColor),
                      ),
                    ),
                  ),
                ),


              ],
            ))
          ],),
        ),
      ),
    );
  }
}
