import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sarya/authentication/forget_password/forget_password_viewmodel/forget_password_cubits.dart';
import 'package:sarya/authentication/forget_password/forget_password_viewmodel/reset_password_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/avatar_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/country_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/activity_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/checklist_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/transport_cubits.dart';
import 'package:sarya/create_intinerary/intinerary_view_model/update_intinerary_cubits.dart';
import 'package:sarya/extensions/string_extension.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/payments/payments_view_model/update_bank_cubits.dart';
import 'package:sarya/settings/avatar/view_model/update_avatar_cubits.dart';
import 'package:sarya/settings/email/view_model/email_cubits.dart';
import 'package:sarya/settings/name/view_model/name_cubits.dart';
import 'package:sarya/settings/phone/view_model/phone_cubits.dart';
import 'package:sarya/shop/shop_view_model/public_cubits.dart';
import 'package:sarya/shop/shop_view_model/status_itinerary_cubits.dart';
import 'package:sarya/theme/color_scheme.dart';

import 'authentication/signin/signin_view_model/signin_cubits.dart';
import 'create_intinerary/intinerary_view_model/airport_cubits.dart';
import 'create_intinerary/intinerary_view_model/create_intinerary_cubits.dart';
import 'create_intinerary/intinerary_view_model/day_update_intinerary_cubits.dart';
import 'create_intinerary/intinerary_view_model/trip_cubits.dart';
import 'navigation/navigation_service.dart';
import 'navigation/router.dart' as routes;
import 'navigation/router_path.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInCubits()),
        BlocProvider(create: (context) => SignupCubits()),
        BlocProvider(create: (context) => ForgetPasswordCubits()),
        BlocProvider(create: (context) => AvatarCubits()),
        BlocProvider(create: (context) => CountryCubits()),
        BlocProvider(create: (context) => ResetPasswordCubits()),
        BlocProvider(create: (context) => NameCubits()),
        BlocProvider(create: (context) => PhoneCubits()),
        BlocProvider(create: (context) => EmailCubits()),
        BlocProvider(create: (context) => UpdateAvatarCubits()),
        BlocProvider(create: (context) => UpdateBankCubits()),
        BlocProvider(create: (context) => TripCubits()),
        BlocProvider(create: (context) => CheckListCubits()),
        BlocProvider(create: (context) => ActivityCubits()),
        BlocProvider(create: (context) => TransportCubits()),
        BlocProvider(create: (context) => PublicItineraryCubits()),
        BlocProvider(create: (context) => CreateIntineraryCubits()),
        BlocProvider(create: (context) => UpdateIntineraryCubits()),
        BlocProvider(create: (context) => AirportCubits()),
        BlocProvider(create: (context) => StatusItineraryCubits()),
        BlocProvider(create: (context) => DayUpdateIntineraryCubits()),
      ],
      child: MaterialApp(
        title: 'Sarya',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: routes.generateRoute,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();

    Future.delayed(Duration(seconds: 3), () {
      _navigationService.navigatePushReplace(loginRout);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'app_icon'.svg,
              color: AppColor.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
