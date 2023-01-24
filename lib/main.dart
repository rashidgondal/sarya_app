import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/authentication/forget_password/forget_password_viewmodel/forget_password_cubits.dart';
import 'package:sarya/authentication/signin/view/login_screen.dart';
import 'package:sarya/authentication/signup/signup_view_model/avatar_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/country_cubits.dart';
import 'package:sarya/authentication/signup/signup_view_model/signup_cubits.dart';
import 'package:sarya/locator.dart';
import 'authentication/signin/signin_view_model/signin_cubits.dart';
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
