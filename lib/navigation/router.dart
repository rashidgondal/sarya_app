import 'package:flutter/material.dart';
import 'package:sarya/authentication/forget_password/view/forget_password_screen.dart';
import 'package:sarya/authentication/forget_password/view/reset_password_screen.dart';
import 'package:sarya/authentication/signin/view/login_screen.dart';
import 'package:sarya/authentication/signup/view/choose_avatar.dart';
import 'package:sarya/authentication/signup/view/success_screen.dart';
import 'package:sarya/search_places.dart';
import 'package:sarya/settings/avatar/view/avatar_screen.dart';
import 'package:sarya/settings/birthday/view/birthday_screen.dart';
import 'package:sarya/settings/email/view/email_screen.dart';
import 'package:sarya/settings/name/view/name_screen.dart';
import 'package:sarya/settings/password/view/password_screen.dart';
import 'package:sarya/settings/phone/view/phone_screen.dart';
import 'package:sarya/story_view/story_view.dart';
import 'package:sarya/utils/constant.dart';
import 'package:sarya/create_intinerary/view/day_design_intinerary.dart';
import 'package:sarya/create_intinerary/view/summary.dart';
import 'package:sarya/home/view/main_page.dart';
import '../authentication/signin/models/signin_request_model.dart';
import '../authentication/signup/view/avatars_screen.dart';
import '../authentication/signup/view/signup_screen.dart';
import '../create_intinerary/view/check_list.dart';
import '../create_intinerary/view/design_intinerary.dart';
import '../create_intinerary/view/foodAndShoppingInfo.dart';
import '../create_intinerary/view/select_destination.dart';
import '../customWidgets/share_intinerary.dart';
import '../customWidgets/show_aimation.dart';
import '../customWidgets/term_and_condtions.dart';
import '../home/model/sold_all_response.dart';
import '../home/view/draft_itinerary_screen.dart';
import '../home/view/sold_itinerary_detail_screen.dart';
import '../home/view/sold_itinerary_screen.dart';
import '../home/view/view_marker_screen.dart';
import '../payments/view/bank_detail.dart';
import '../payments/view/bank_update.dart';
import '../settings/avatar/view/update_avatar.dart';
import '../settings/view/settings_home_screen.dart';
import '../shop/view/search_screen.dart';
import 'router_path.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {

  print("setting......${settings.name}");
  switch (settings.name) {
    case routes.loginRout:
      return MaterialPageRoute(
        builder: (context) => const  LoginScreen(),
      );
    case routes.signupRout:
      return MaterialPageRoute(
        builder: (context) =>   SignupScreen(countries: settings.arguments as List<dynamic>),
      );
    case routes.forgetRout:
      return MaterialPageRoute(
        builder: (context) =>   ForgetPasswordScreen(map: settings.arguments as Map,),
      );
    case routes.resetRout:
      return MaterialPageRoute(
        builder: (context) =>  ResetPasswordScreen(map: settings.arguments as Map,),
      );
    case routes.dashboardRout:
      return MaterialPageRoute(
        builder: (context) => const  MainPage(),
      );
    case routes.termRout:
      return MaterialPageRoute(
        builder: (context) =>  const TermAndCondition(isFromSignUp: false,),
      );
    case routes.termRoutSecond:
      return MaterialPageRoute(
        builder: (context) =>  const  TermAndCondition(isFromSignUp: true,),
      );
    case routes.successRout:
      return MaterialPageRoute(
        builder: (context) =>  const SuccessScreen(),
      );
    case routes.chooseAvatarRout:
      return MaterialPageRoute(
        builder: (context) =>    ChooseAvatar(map: settings.arguments as Map,));
    case routes.updateAvatarRout:
      return MaterialPageRoute(
          builder: (context) =>    UpdateAvatar(map: settings.arguments as Map,));
    case routes.avatarRout:
      return MaterialPageRoute(
          builder: (context) =>    AvatarsTypesScreen(map: settings.arguments as Map,));
    case routes.destinationRout:
      return MaterialPageRoute(
        builder: (context) =>   SelectDestination(map: settings.arguments as Map,),
      );
    case routes.summaryRoutStart:
      return MaterialPageRoute(
        builder: (context) =>   SummaryScreen(routeName: start, map: settings.arguments as Map,),
      );
    case routes.summaryRoutSold:
      return MaterialPageRoute(
        builder: (context) =>   SummaryScreen(routeName: sold, map: settings.arguments as Map,),
      );
    case routes.summaryRoutEdit:
      return MaterialPageRoute(
        builder: (context) =>   SummaryScreen(routeName: edit, map: settings.arguments as Map,),
      );
      case routes.summaryRoutPurchase:
      return MaterialPageRoute(
        builder: (context) =>   SummaryScreen(routeName: purchase, map: settings.arguments as Map,),
      );
    case routes.designIntineraryRoute:
      return MaterialPageRoute(
        builder: (context) =>   DesignIntineraryScreen(map: settings.arguments as Map,),
      );
    case routes.draftIntineraryRoute:
      return MaterialPageRoute(
        builder: (context) =>  const DraftItineraryScreen(),
      );
    case routes.dayDesignRoute:
      return MaterialPageRoute(
        builder: (context) =>   DayDesignIntineraryScreen(map: settings.arguments as Map,),
      );
    case routes.checkListRoute:
      return MaterialPageRoute(
        builder: (context) =>   CheckListScreen(map:  settings.arguments as Map,),
      );
    case routes.soldIntineraryRoute:
      return MaterialPageRoute(
        builder: (context) =>  const SoldItineraryScreen(),
      );
    case routes.shareIntineraryRoute:
      return MaterialPageRoute(
        builder: (context) =>  const ShareIntinerary(),
      );
    case routes.animationRoute:
      return MaterialPageRoute(
        builder: (context) =>   ShowAnimation(signInRequest: settings.arguments as SignInRequest,),
      );
    case routes.settingRoute:
      return MaterialPageRoute(
        builder: (context) =>  const SettingsHome());

    case routes.nameSettingRoute:
      return MaterialPageRoute(
        builder: (context) =>  const NameScreen(),
      );
    case routes.avatarSettingRoute:
      return MaterialPageRoute(
        builder: (context) =>  const AvatarScreen(),
      );
    case routes.mobileSettingRoute:
      return MaterialPageRoute(
        builder: (context) =>  const PhoneScreen(),
      );
    case routes.emailSettingRoute:
      return MaterialPageRoute(
        builder: (context) =>  const EmailScreen(),
      );
    case routes.birthdaySettingRoute:
      return MaterialPageRoute(
        builder: (context) => const BirthdayScreen()
      );
    case routes.passwordSettingRoute:
      return MaterialPageRoute(
          builder: (context) =>  const PasswordScreen());
    case routes.bankDetailRoute:
      return MaterialPageRoute(
          builder: (context) =>  const BankDetail());
    case routes.bankUpdateRoute:
      return MaterialPageRoute(
          builder: (context) =>  const UpdateBankDetails());
    case routes.searchPlacesRoute:
      return MaterialPageRoute(
          builder: (context) =>   SearchPlacesScreen(map: settings.arguments as Map,));
    case routes.foodShoppingRoute:
      return MaterialPageRoute(
          builder: (context) => FoodAndShoppingInformation(map: settings.arguments as Map,));
    case routes.searchItineraryRoute:
      return MaterialPageRoute(
          builder: (context) =>  const SearchItineraryScreen());
    case routes.storyViewRoute:
      return MaterialPageRoute(
          builder: (context) =>   StoryViewModel(images: settings.arguments as List<String>,));
    case routes.mapViewRoute:
      return MaterialPageRoute(
          builder: (context) =>  ViewMarkerScreen(map: settings.arguments as Map,));
    case routes.soldDetailViewRoute:
      return MaterialPageRoute(
          builder: (context) =>  SoldItineraryDetail(soldAllResult: settings.arguments as SoldAllResult,));

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }


}