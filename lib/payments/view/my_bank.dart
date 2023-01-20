import 'package:flutter/material.dart';
import 'package:sarya/customWidgets/dialoge_bank_help.dart';
import 'package:sarya/theme/color_scheme.dart';

class MyBank extends StatefulWidget {
  const MyBank({Key? key}) : super(key: key);

  @override
  State<MyBank> createState() => _MyBankState();
}

class _MyBankState extends State<MyBank> {
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
                        "Create new ",
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
              "My Banks",
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>  BankHelp());
              }, icon:const  Icon(Icons.question_mark, color: AppColor.lightIndigo))
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                customWidget(title: "Dubai Islamic Bank",subTitle: '************1234', size: size)
              ],
            ),
          ),
        ),
      ),
    );
  }


  Stack customWidget({required title, required subTitle, required Size size}) {
    return Stack(
      children: [
        SizedBox(
          height: 106.0,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    height: 75.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: AppColor.borderColor2, width: 1)),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ),
                      subtitle: Text(
                        subTitle,
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColor.headingColor2),
                      ),
                      trailing: Theme(

                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor:  AppColor.aquaCasper,),
                        child:Checkbox(
                          value: true,
                          onChanged: (bool? value) {},
                          focusColor:  AppColor.aquaCasper,
                          activeColor: AppColor.aquaCasper,

                        ),
                      )
                      ,
                    )

                  /*Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColor.headingColor2),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.lightIndigo,
                          size: 20,
                        )
                      ],
                    )*/

                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 78,
          left: 20,
          child: Container(
            color: AppColor.whiteColor,
            height: 20,
            width: 30,
            child: const Icon(
              Icons.food_bank_outlined,
              size: 20,
              color: AppColor.aquaCasper,
            ),
          ),
        ),
      ],
    );
  }

}
