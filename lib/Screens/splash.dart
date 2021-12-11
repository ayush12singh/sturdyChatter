//Packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

//Services
import '../services/navigation.dart';
import '../services/media.dart';
import '../services/cloud_storage.dart';
import 'package:chatter/services/database.dart';

// ignore_for_file: non_constant_identifier_names

class SplashScreen extends StatefulWidget {
  final VoidCallback InitializationComplete;

  const SplashScreen({required Key key, required this.InitializationComplete})
      : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      setup().then(
        (_) => widget.InitializationComplete(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
          scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0)),
      home: Scaffold(
          body: Center(
              child: Container(
        height: 210,
        width: 210,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/logo.png'))),
      ))),
    );
  }
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  registerServices();
}

void registerServices() {
  GetIt.instance.registerSingleton<Navigation>(
    Navigation(),
  );
  GetIt.instance.registerSingleton<MediaService>(MediaService());
  GetIt.instance.registerSingleton<CloudStorage>(CloudStorage());
  GetIt.instance.registerSingleton<Database>((Database()));
}
