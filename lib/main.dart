import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/home/repository/character_repository.dart';
import 'package:rick_and_morty_dex/modules/home/viewmodel/character_store.dart';
import 'package:rick_and_morty_dex/modules/welcome/viewmodel/welcome_store.dart';
import 'app/app_widget.dart';
import 'core/http/dio_client.dart';

void main() {
  final dio = DioClient.instance;

  final repo = CharacterRepository(dio);
  final characterStore = CharacterStore(repo);
  final welcomeStore = WelcomeStore();

  runApp(AppWidget(characterStore: characterStore, welcomeStore: welcomeStore));
}
