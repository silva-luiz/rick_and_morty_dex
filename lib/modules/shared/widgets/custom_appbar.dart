import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/home/viewmodel/character_store.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';
import 'package:rick_and_morty_dex/modules/welcome/view/welcome_page.dart';
import 'package:rick_and_morty_dex/modules/welcome/viewmodel/welcome_store.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CharacterStore characterStore;
  final WelcomeStore welcomeStore;

  const CustomAppBar({
    super.key,
    required this.characterStore,
    required this.welcomeStore,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        onChanged: characterStore.setSearchQuery,
        style: const TextStyle(
          color: AppColors.blackText,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          hintText: 'Find character',
          hintStyle: TextStyle(color: AppColors.blackText),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: AppColors.blackText),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: AppColors.blackText),
          onPressed: () {
            characterStore.dispose();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (_) => WelcomePage(
                      characterStore: characterStore,
                      welcomeStore: welcomeStore,
                    ),
              ),
            );
          },
        ),
      ],
      backgroundColor: AppColors.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
