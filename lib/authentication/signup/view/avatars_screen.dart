import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarya/authentication/signup/model/avatar_response.dart';
import 'package:sarya/authentication/signup/signup_view_model/avatar_cubits.dart';
import 'package:sarya/navigation/router_path.dart';
import 'package:sarya/theme/color_scheme.dart';
import '../../../locator.dart';
import '../../../navigation/navigation_service.dart';
import '../signup_view_model/avatar_states.dart';

class AvatarsTypesScreen extends StatefulWidget {
  final Map map;
  const AvatarsTypesScreen({Key? key, required this.map}) : super(key: key);

  @override
  State<AvatarsTypesScreen> createState() => _AvatarsTypesScreenState();
}

class _AvatarsTypesScreenState extends State<AvatarsTypesScreen> {
  late NavigationService _navigationService;
   String baseUrl ='';
   String format ='';

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();
    context.read<AvatarCubits>().getAvatar();
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
              style: TextStyle(fontSize: 17.0, color: AppColor.colorLiteBlack5),
            ),
            centerTitle: true,
          ),

          body: Container(
            padding: const EdgeInsets.only(left: 65.0, right: 65, ),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<AvatarCubits, AvatarStates>(
                      builder: (context, state) {
                    if (state is AvatarInitial) {
                      return const SizedBox();
                    }

                    if (state is AvatarLoading) {
                      return const Center(child: CupertinoActivityIndicator());
                    }

                    if (state is AvatarLoaded) {
                      List<AvatarResult> list = state.avatarResponse.result??[];
                       baseUrl = state.avatarResponse.baseUrl??'';
                       format = state.avatarResponse.format??'';

                      return GridView.builder(
                        itemCount: list.length,
                        padding:const EdgeInsets.only(top: 50),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.0,
                                mainAxisSpacing: 30,
                                crossAxisSpacing: 30),
                        itemBuilder: (context, index) => _buildImageItem(
                            imageUrl: '$baseUrl${list[index].name}.$format',
                            list: list,
                            listOfColor: list[index].colors??[]
                        ),
                      );

                    }
                    else {
                      return const Center(
                        child: Text("No Data found"),
                      );
                    }

                  }),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageItem({
    required String imageUrl,
    required List list,
    required List listOfColor
  }) {
    return InkWell(
      onTap: () {

        if(widget.map['isFromSignUp'] == true) {
          _navigationService.navigateTo(chooseAvatarRout, arguments: {
            'listOfColor': listOfColor,
            'url': baseUrl,
            'format': format,
          });
        }else{
          _navigationService.navigateTo(updateAvatarRout, arguments: {
            'listOfColor': listOfColor,
            'url': baseUrl,
            'format': format,
          });
        }
      },
      child: Container(

        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),
            border:Border.all(color: AppColor.lightIndigo, width: 1)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(imageUrl),
          ],
        ),
      ),
    );
  }
}
