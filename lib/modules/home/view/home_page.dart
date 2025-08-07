import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_dex/modules/home/view/character_details_page.dart';
import 'package:rick_and_morty_dex/modules/home/view/widgets/character_card.dart';
import 'package:rick_and_morty_dex/modules/home/viewmodel/character_store.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';
import 'package:rick_and_morty_dex/modules/shared/widgets/spinning_image.dart';

class HomePage extends StatefulWidget {
  final CharacterStore store;

  const HomePage({super.key, required this.store});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.store.getCharacters();
  }

  @override
  void dispose() {
    widget.store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: TextField(
          onChanged: widget.store.setSearchQuery,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          decoration: const InputDecoration(
            hintText: 'Find character',
            hintStyle: TextStyle(color: AppColors.primaryText),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: AppColors.primaryText),
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Observer(
        builder: (_) {
          if (widget.store.isLoading) {
            return const Center(child: SpinningImage());
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome to Rick and Morty Dex',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Click on a character to see details',
                style: TextStyle(color: AppColors.secondaryText, fontSize: 16),
              ),
              if (widget.store.isFallback)
                Container(
                  width: double.infinity,
                  color: AppColors.warning,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'API offline. Showing default characters.',
                    style: TextStyle(
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: widget.store.filteredCharacters.length,
                  itemBuilder: (_, index) {
                    final character = widget.store.filteredCharacters[index];
                    return CharacterCard(
                      character: character,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    CharacterDetailsPage(character: character),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.primary,
        onPressed: widget.store.getCharacters,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
