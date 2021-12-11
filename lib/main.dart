//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Screens
import './Screens/home.dart';
import './Screens/register.dart';
import 'Screens/splash.dart';
import './Screens/login.dart';

//Providers
import './provider/authentication.dart';

//Services
import './services/navigation.dart';

void main() {
  runApp(SplashScreen(
      key: UniqueKey(),
      InitializationComplete: () {
        runApp(const MainApp());
      }));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext context) {
            return AuthenticationProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'Chatter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
            scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromRGBO(30, 29, 37, 1.0))),
        navigatorKey: Navigation.navkey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => const LoginPage(),
          '/register': (BuildContext context) => const RegisterPage(),
          '/home': (BuildContext context) => const HomePage()
        },
      ),
    );
  }
}
