import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/home/view/widgets/character_status.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';
import '../../model/character_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;
  final VoidCallback onTap;

  const CharacterCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 560,
        child: Card(
          color: AppColors.cardBackground,
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              SizedBox(
                height: 135,
                width: double.infinity,
                child:
                    character.image.startsWith('http')
                        ? Image.network(character.image, fit: BoxFit.cover)
                        : Image.asset(character.image, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [CharacterStatus(character: character)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
