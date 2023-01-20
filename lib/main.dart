import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/forget_password/forget_password_viewmodel/forget_password_cubits.dart';
import 'package:sarya/authentication/signin/models/signin_request_model.dart';
import 'package:sarya/authentication/signin/view/login_screen.dart';
import 'package:sarya/authentication/signup/signup_view_model/avatar_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/country_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_cubits.dart';
import 'package:sarya/locator.dart';
import 'package:sarya/profile/view/add_contact_byusername_screen.dart';
import 'package:sarya/profile/view/add_contact_screen.dart';
import 'package:sarya/profile/view/friends_screen.dart';
import 'package:sarya/profile/view/profile_home.dart';
import 'package:sarya/profile/view/share_location_screen.dart';
import 'package:sarya/profile/view/sync_contact_screen.dart';
import 'package:sarya/settings/view/avatar_screen.dart';
import 'package:sarya/settings/view/birthday_screen.dart';
import 'package:sarya/settings/view/contact_screen.dart';
import 'package:sarya/settings/view/email_screen.dart';
import 'package:sarya/settings/view/help_screen.dart';
import 'package:sarya/settings/view/name_screen.dart';
import 'package:sarya/settings/view/notification_screen.dart';
import 'package:sarya/settings/view/password_screen.dart';
import 'package:sarya/settings/view/phone_screen.dart';
import 'package:sarya/settings/view/see_my_location_screen.dart';
import 'package:sarya/settings/view/settings_home_screen.dart';
import 'package:sarya/user/view/user_home.dart';
import 'authentication/forget_password/view/forget_password_screen.dart';
import 'authentication/forget_password/view/reset_password_screen.dart';
import 'authentication/signin/signin_view_model/signin_cubits.dart';
import 'authentication/signup/view/choose_avatar.dart';
import 'authentication/signup/view/success_screen.dart';
import 'customWidgets/dialoge_share_user_name.dart';
import 'customWidgets/show_aimation.dart';
import 'navigation/navigation_service.dart';
import  'navigation/router.dart' as routes;


void main() {
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
      ],
      child: MaterialApp(
        title: 'Sarya',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: routes.generateRoute,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
