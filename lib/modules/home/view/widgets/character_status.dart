import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/home/model/character_model.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';

class CharacterStatus extends StatelessWidget {
  final CharacterModel character;
  const CharacterStatus({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          character.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    character.status == 'Alive'
                        ? AppColors.success
                        : character.status == 'Dead'
                        ? AppColors.error
                        : AppColors.warning,
              ),
            ),
            SizedBox(width: 6),
            Text(
              character.status,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getSpeciesIcon(character.species),
              size: 20,
              color: AppColors.primaryText,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                character.species,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _getSpeciesIcon(String species) {
    if (species == "Human") return Icons.tag_faces;
    if (species == "Alien") return Icons.rocket;
    return Icons.pets;
  }
}
