class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String? type;
  final String? gender;
  final String? origin;
  final String? location;
  final int? episodeCount;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.episodeCount,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      image: json['image'],
      type: json['type'] == '' ? null : json['type'],
      gender: json['gender'],
      origin: json['origin']?['name'],
      location: json['location']?['name'],
      episodeCount: (json['episode'] as List?)?.length,
    );
  }
}
