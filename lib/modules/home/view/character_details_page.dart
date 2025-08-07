import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/home/view/widgets/info_item.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';
import 'package:rick_and_morty_dex/modules/shared/extensions/string_extensions.dart';
import '../model/character_model.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("${character.name.possessiveForm} profile"),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.network(
                    character.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                character.name,
                style: textTheme.headlineLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              InfoItem(
                label: 'Status',
                value: character.status,
                icon: Icons.info_outline,
              ),
              InfoItem(
                label: 'Species',
                value: character.species,
                icon: Icons.pets,
              ),
              const SizedBox(height: 18),
              Text(
                'Additional Information',
                style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              InfoItem(
                label: 'Character ID',
                value: '#${character.id}',
                icon: Icons.badge,
              ),
              InfoItem(
                label: 'Type',
                value: character.type ?? 'Unknown',
                icon: Icons.category,
              ),
              InfoItem(
                label: 'Origin',
                value: character.origin ?? 'Unknown',
                icon: Icons.public,
              ),
              InfoItem(
                label: 'Location',
                value: character.location ?? 'Unknown',
                icon: Icons.location_on,
              ),
              InfoItem(
                label: 'Number of Episodes',
                value: '${character.episodeCount ?? 'Unknown'}',
                icon: Icons.tv,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
