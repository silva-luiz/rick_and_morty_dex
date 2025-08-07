// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on _CharacterStoreBase, Store {
  Computed<List<CharacterModel>>? _$filteredCharactersComputed;

  @override
  List<CharacterModel> get filteredCharacters =>
      (_$filteredCharactersComputed ??= Computed<List<CharacterModel>>(
            () => super.filteredCharacters,
            name: '_CharacterStoreBase.filteredCharacters',
          ))
          .value;

  late final _$isFallbackAtom = Atom(
    name: '_CharacterStoreBase.isFallback',
    context: context,
  );

  @override
  bool get isFallback {
    _$isFallbackAtom.reportRead();
    return super.isFallback;
  }

  @override
  set isFallback(bool value) {
    _$isFallbackAtom.reportWrite(value, super.isFallback, () {
      super.isFallback = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_CharacterStoreBase.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$charactersAtom = Atom(
    name: '_CharacterStoreBase.characters',
    context: context,
  );

  @override
  ObservableList<CharacterModel> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<CharacterModel> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_CharacterStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getCharactersAsyncAction = AsyncAction(
    '_CharacterStoreBase.getCharacters',
    context: context,
  );

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  late final _$_CharacterStoreBaseActionController = ActionController(
    name: '_CharacterStoreBase',
    context: context,
  );

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_CharacterStoreBaseActionController.startAction(
      name: '_CharacterStoreBase.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_CharacterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFallback: ${isFallback},
searchQuery: ${searchQuery},
characters: ${characters},
isLoading: ${isLoading},
filteredCharacters: ${filteredCharacters}
    ''';
  }
}
