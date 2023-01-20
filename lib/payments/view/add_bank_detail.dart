import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/dialoge_bank_help.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../../customWidgets/custom_text_field.dart';

class AddBankDetail extends StatefulWidget {
  const AddBankDetail({Key? key}) : super(key: key);

  @override
  State<AddBankDetail> createState() => _AddBankDetailState();
}

class _AddBankDetailState extends State<AddBankDetail> {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          bottomNavigationBar: Container(
            height: 100,
            color: AppColor.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 46.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Center(
                      child: Text(
                        "Create",
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
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 60,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.lightIndigo,
              ),
              onPressed: () {},
            ),
            backgroundColor: AppColor.aquaCasper2,
            title: const Text(
              "Ad Banks Detail",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,

          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                customWidgetDropDown(title: "Dubai Islamic Bank", size: size),
                CustomTextField(maxLine: 1, textEditingController: textEditingController, size: size, textInputType: TextInputType.text, hintText: "Bank Name", icon:const Icon(Icons.question_mark, size: 15,)),
                CustomTextField(maxLine: 1, textEditingController: textEditingController, size: size, textInputType: TextInputType.text, hintText: "Beneficiary Name", icon:const Icon(Icons.question_mark, size: 15,)),
                CustomTextField(maxLine: 1, textEditingController: textEditingController, size: size, textInputType: TextInputType.text, hintText: "Account No.", icon:const Icon(Icons.question_mark, size: 15,)),
                CustomTextField(maxLine: 1, textEditingController: textEditingController, size: size, textInputType: TextInputType.text, hintText: "IBAN No.", icon:const Icon(Icons.question_mark, size: 15,)),
                CustomTextField(maxLine: 1, textEditingController: textEditingController, size: size, textInputType: TextInputType.text, hintText: "Swift Code", icon:const Icon(Icons.question_mark, size: 15,)),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Stack customWidgetDropDown({required title, required Size size, }) {
    return Stack(
      children: [
        SizedBox(
          height: 80.0,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    height: 54.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: AppColor.borderColor2, width: 1)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.lightIndigo,
                          size: 20,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 60,
          left: 20,
          child: Container(
            color: AppColor.whiteColor,
            height: 20,
            width: 30,
            child: const Icon(
              Icons.question_mark,
              size: 15,
              color: AppColor.headingColor2,
            ),
          ),
        ),
      ],
    );
  }


}
