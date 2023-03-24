import 'package:flutter/material.dart';
import 'package:gruber_app/assets/theme.dart';
import 'package:gruber_app/l10n/l10n.dart';
import 'package:gruber_app/pages/homeScreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeScreen(),
    );
  }
}
