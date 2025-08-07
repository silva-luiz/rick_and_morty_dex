import 'dart:async';
import 'package:mobx/mobx.dart';
import '../model/character_model.dart';
import '../repository/character_repository.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;

abstract class _CharacterStoreBase with Store {
  final CharacterRepository repository;

  _CharacterStoreBase(this.repository);

  Timer? _timer;

  @observable
  int currentPage = 1;

  @observable
  bool isLoadingMore = false;

  @observable
  bool hasNextPage = true; // baseando-se no nextPageUrl

  String? _nextPageUrl;

  @observable
  bool isFallback = false;

  @observable
  String searchQuery = '';

  @observable
  ObservableList<CharacterModel> characters = ObservableList.of([]);

  @observable
  bool isLoading = false;

  @computed
  List<CharacterModel> get filteredCharacters {
    if (searchQuery.isEmpty) return characters;
    return characters
        .where(
          (char) => char.name.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  @action
  void setSearchQuery(String value) {
    searchQuery = value;
  }

  @action
  Future<void> getCharacters() async {
    isLoading = true;
    currentPage = 1;
    try {
      final result = await repository.fetchCharacters(page: currentPage);
      characters.clear();
      characters.addAll(result.characters);
      _nextPageUrl = result.nextPageUrl;
      hasNextPage = _nextPageUrl != null;
      isFallback = false;
    } catch (e) {
      final fallbackCharacters = [
        CharacterModel(
          id: 1,
          name: "Morty Smith",
          image: "assets/images/default_characters/morty.jpg",
          status: 'Alive',
          species: 'Human',
        ),
        CharacterModel(
          id: 2,
          name: "Rick Sanchez",
          image: "assets/images/default_characters/rick.jpg",
          status: 'Alive',
          species: 'Alien',
        ),
        CharacterModel(
          id: 3,
          name: "Beth Smith",
          image: "assets/images/default_characters/beth.jpg",
          status: 'Dead',
          species: 'Human',
        ),
        CharacterModel(
          id: 4,
          name: "Jerry Smith",
          image: "assets/images/default_characters/jerry.jpg",
          status: 'Dead',
          species: 'Human',
        ),
      ];
      characters.clear();
      characters.addAll(fallbackCharacters);
      isFallback = true;
      hasNextPage = false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadMoreCharacters() async {
    if (isLoadingMore || !hasNextPage) return;

    isLoadingMore = true;
    try {
      currentPage++;
      final result = await repository.fetchCharacters(page: currentPage);
      characters.addAll(result.characters);
      _nextPageUrl = result.nextPageUrl;
      hasNextPage = _nextPageUrl != null;
    } catch (e) {
      currentPage--;
    } finally {
      isLoadingMore = false;
    }
  }

  void startPeriodicFetch() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 15), (_) {
      getCharacters();
    });
  }

  void stopPeriodicFetch() {
    _timer?.cancel();
  }

  void dispose() {
    _timer?.cancel();
  }
}
