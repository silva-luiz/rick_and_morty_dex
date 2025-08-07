import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty_dex/modules/home/view/character_details_page.dart';
import 'package:rick_and_morty_dex/modules/home/view/widgets/character_card.dart';
import 'package:rick_and_morty_dex/modules/home/viewmodel/character_store.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';
import 'package:rick_and_morty_dex/modules/shared/widgets/custom_appbar.dart';
import 'package:rick_and_morty_dex/modules/shared/widgets/spinning_image.dart';
import 'package:rick_and_morty_dex/modules/welcome/viewmodel/welcome_store.dart';

class HomePage extends StatefulWidget {
  final CharacterStore characterStore;
  final WelcomeStore welcomeStore;

  const HomePage({
    super.key,
    required this.characterStore,
    required this.welcomeStore,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      widget.characterStore.loadMoreCharacters();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);

    widget.characterStore.getCharacters();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    widget.characterStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        characterStore: widget.characterStore,
        welcomeStore: widget.welcomeStore,
      ),
      body: Observer(
        builder: (_) {
          if (widget.characterStore.isLoading) {
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
              if (widget.characterStore.isFallback)
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
                child: Observer(
                  builder: (_) {
                    final characters = widget.characterStore.filteredCharacters;
                    return GridView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 3 / 4,
                          ),
                      itemCount:
                          widget.characterStore.isLoadingMore
                              ? characters.length + 1
                              : characters.length,
                      itemBuilder: (_, index) {
                        if (index >= characters.length) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final character = characters[index];
                        return CharacterCard(
                          character: character,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => CharacterDetailsPage(
                                      character: character,
                                    ),
                              ),
                            );
                          },
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
        onPressed: widget.characterStore.getCharacters,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
