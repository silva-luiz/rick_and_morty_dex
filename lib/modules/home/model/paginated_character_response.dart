import 'package:rick_and_morty_dex/modules/home/model/character_model.dart';

class PaginatedCharacterResponse {
  final List<CharacterModel> characters;
  final String? nextPageUrl;

  PaginatedCharacterResponse({
    required this.characters,
    required this.nextPageUrl,
  });

  factory PaginatedCharacterResponse.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List<dynamic>;
    final info = json['info'];

    return PaginatedCharacterResponse(
      characters: results.map((e) => CharacterModel.fromJson(e)).toList(),
      nextPageUrl: info['next'],
    );
  }
}
