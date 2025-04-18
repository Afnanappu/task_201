import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_201/core/app_theme.dart';
import 'package:task_201/view/screens/home_screen.dart';
import 'package:task_201/view_models/progress_card_provider.dart';
import 'package:task_201/view_models/toggle_card_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ToggleCardProvider()),
        ChangeNotifierProvider(create: (context) => ProgressCardProvider()),
      ],
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            theme: AppTheme.lightTheme,
          ),
    );
  }
}
