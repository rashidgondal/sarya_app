import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/settings/avatar/view_model/update_avatar_states.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../customWidgets/data_loading.dart';
import '../../../locator.dart';
import '../../../navigation/navigation_service.dart';
import '../../../settings/avatar/model/update_avatar_request.dart';
import '../../../settings/avatar/view_model/update_avatar_cubits.dart';

class UpdateAvatar extends StatefulWidget {
  final Map map;

  const UpdateAvatar({Key? key, required this.map}) : super(key: key);

  @override
  State<UpdateAvatar> createState() => _UpdateAvatarState();
}

class _UpdateAvatarState extends State<UpdateAvatar> {
  late NavigationService _navigationService;

  int selectedPic = 0;

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
      child: SafeArea(child: BlocBuilder<UpdateAvatarCubits, UpdateAvatarStates>(
        builder: (context, state) {
          bool loading = false;

          if (state is UpdateAvatarInitial) {
            loading = false;
          }

          if (state is UpdateAvatarLoading) {
            loading = true;
          }

          if (state is UpdateAvatarLoaded) {
            loading = false;
          }

          return DataLoading(
            isLoading: loading,
            child: Scaffold(
              backgroundColor: AppColor.whiteColor,
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 50,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.lightIndigo,
                  ),
                  onPressed: () {
                    _navigationService.goBack();
                  },
                ),
                backgroundColor: AppColor.aquaCasper2,
                title: const Text(
                  "Customize you Avatar",
                  style: TextStyle(
                      fontSize: 17.0, color: AppColor.colorLiteBlack5),
                ),
                centerTitle: true,
              ),
              bottomSheet: Container(
                color: AppColor.whiteColor,
                height: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _navigationService.goBack();
                      },
                      child: Container(
                        height: 46.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: AppColor.colorLiteBlack4,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: const Center(
                          child: Text(
                            "Back",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: AppColor.colorBlack),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () async {

                        String url = '${widget.map['url']}${widget
                            .map['listOfColor'][selectedPic]}.${widget
                            .map['format']}';
                        String netWork = '${widget.map['listOfColor'][selectedPic]}';

                        print("net........$netWork");
                          UpdateAvatarRequest  updateAvatarRequest = UpdateAvatarRequest(avatar: url);
                          context.read<UpdateAvatarCubits>().updateAvatar(updateAvatarRequest: updateAvatarRequest, navigationService: _navigationService);

                      },
                      child: Container(
                        height: 46.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: AppColor.buttonColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: const Center(
                          child: Text(
                            "Done",
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
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 50),
                    itemCount: widget.map['listOfColor'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return covertImage(
                          size: size,
                          index: index,
                          imageUrl:
                              '${widget.map['url']}${widget.map['listOfColor'][index]}.${widget.map['format']}');
                    }),
              ),
            ),
          );
        },
      )),
    );
  }

  Widget covertImage(
      {required Size size, required int index, required imageUrl}) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedPic = index;
          });
        },
        child: Container(
          height: 106.0,
          width: 106.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: selectedPic == index
                  ? Border.all(color: AppColor.lightIndigo, width: 3)
                  : Border.all(color: AppColor.colorGrey, width: 1)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(imageUrl),
            ],
          ),
        ),
      ),
    );
  }
}
