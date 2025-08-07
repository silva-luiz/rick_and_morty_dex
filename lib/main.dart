import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/home/repository/character_repository.dart';
import 'package:rick_and_morty_dex/modules/home/viewmodel/character_store.dart';
import 'app/app_widget.dart';
import 'core/http/dio_client.dart';


void main() {
  final dio = DioClient.instance;

  final repo = CharacterRepository(dio);
  final store = CharacterStore(repo);

  runApp(AppWidget(store: store));
}
