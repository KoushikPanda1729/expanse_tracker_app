import 'package:flutter/material.dart';
import 'package:expensetracker/commons/router/app_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env").catchError((e) {
      print('Warning: Could not load .env file: $e');
    });
  } catch (e) {
    print('Error loading .env: $e');
  }

  runApp(
    // Wrap with ProviderScope for Riverpod
    const ProviderScope(
      child: MyAppRouter(),
    ),
  );
}

class MyAppRouter extends StatelessWidget {
  const MyAppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Dark icons for light background
    ));
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
