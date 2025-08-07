import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/home/viewmodel/character_store.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';
import 'package:rick_and_morty_dex/modules/welcome/view/welcome_page.dart';
import 'package:rick_and_morty_dex/modules/welcome/viewmodel/welcome_store.dart';

class AppWidget extends StatelessWidget {
  final CharacterStore characterStore;
  final WelcomeStore welcomeStore;

  const AppWidget({
    super.key,
    required this.characterStore,
    required this.welcomeStore,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty Dex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: WelcomePage(
        characterStore: characterStore,
        welcomeStore: welcomeStore,
      ),
    );
  }
}
