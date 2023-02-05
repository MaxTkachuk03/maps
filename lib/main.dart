import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:maps/generated/l10n.dart';
import 'package:maps/pages/screens/splash_screen.dart';
import 'package:maps/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDgUcTK1JGon6-VMB4AZioImb3F3jp0o1k',
      appId: '1:1052406723473:android:fca3d33ce9b230a5446030',
      messagingSenderId: '1052406723473',
      projectId: 'maps-b57a9',
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRouter.generateRoute,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
      },
    );
  }
}
