// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WelcomeStore on _WelcomeStoreBase, Store {
  late final _$openYouTubeVideoAsyncAction = AsyncAction(
    '_WelcomeStoreBase.openYouTubeVideo',
    context: context,
  );

  @override
  Future<void> openYouTubeVideo(String videoUrl) {
    return _$openYouTubeVideoAsyncAction.run(
      () => super.openYouTubeVideo(videoUrl),
    );
  }

  late final _$_WelcomeStoreBaseActionController = ActionController(
    name: '_WelcomeStoreBase',
    context: context,
  );

  @override
  void enterApp(Function onEnter) {
    final _$actionInfo = _$_WelcomeStoreBaseActionController.startAction(
      name: '_WelcomeStoreBase.enterApp',
    );
    try {
      return super.enterApp(onEnter);
    } finally {
      _$_WelcomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
