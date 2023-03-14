import 'package:flutter/material.dart';
import 'package:sarya/theme/color_scheme.dart';

class ItineraryCost extends StatefulWidget {
    final double value;

  const ItineraryCost({Key? key, required this.value})
      : super(key: key);

  @override
  State<ItineraryCost> createState() => _ItineraryCostState();
}

class _ItineraryCostState extends State<ItineraryCost> {
  TextEditingController textEditingController = TextEditingController();
  double costValue = 0.0;

  @override
  void initState() {
    costValue = widget.value;
    textEditingController.text   = costValue.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          const SizedBox(height: 10,),
          Container(
            padding:const  EdgeInsets.symmetric(horizontal: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop('5.0');

                  },
                  child: Container(
                    height: 46.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: AppColor.colorLiteBlack4,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.colorBlack),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    String cost = textEditingController.text;
                    Navigator.of(context).pop(cost);

                  },
                  child: Container(
                    height: 46.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,)

        ],
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Container(
          width: size.width,
          height: size.width/2.5,
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Itinerary Cost",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColor.lightIndigo),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      if(costValue<= 5.0){
                        return;
                      }
                      costValue = costValue- 5.0;
                      textEditingController.text = costValue.toString();
                      setState(() {

                      });
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: AppColor.colorLiteBlack4,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.remove, color: AppColor.colorBlack, size: 30,),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 100,
                      child: TextFormField(
                        controller: textEditingController,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (val){
                          costValue = double.parse(val);
                          setState(() {

                          });
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.colorBlack,
                            fontSize: 32.0,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "0.0",
                          hintStyle: TextStyle(
                              color: AppColor.colorLiteBlack4,
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600)
                        ),
                      )),
                  InkWell(
                    onTap: (){
                      costValue = costValue + 5.0;
                      print("result.........$costValue");
                      textEditingController.text = costValue.toString();
                      setState(() {

                      });
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.add, color: AppColor.whiteColor, size: 30,),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}