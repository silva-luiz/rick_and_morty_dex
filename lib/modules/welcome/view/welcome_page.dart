import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/home/view/home_page.dart';
import 'package:rick_and_morty_dex/modules/home/viewmodel/character_store.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';
import 'package:rick_and_morty_dex/modules/welcome/view/widgets/stroked_text.dart';
import 'package:rick_and_morty_dex/modules/welcome/viewmodel/welcome_store.dart';

class WelcomePage extends StatelessWidget {
  final CharacterStore characterStore;
  final WelcomeStore welcomeStore;

  const WelcomePage({
    super.key,
    required this.characterStore,
    required this.welcomeStore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/background.jpg', fit: BoxFit.cover),
          Container(color: Colors.black.withValues(alpha: 0.7)),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StrokedText(text: 'Welcome to Rick and Morty Dex!'),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      welcomeStore.enterApp(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => HomePage(
                                  characterStore: characterStore,
                                  welcomeStore: welcomeStore,
                                ),
                          ),
                        );
                      });
                    },
                    onLongPress: () {
                      welcomeStore.openYouTubeVideo(
                        'https://www.youtube.com/watch?v=tZp8sY06Qoc&ab_channel=TheMajorNerd',
                      );
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.blackText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
