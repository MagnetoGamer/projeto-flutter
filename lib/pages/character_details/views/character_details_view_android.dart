import 'package:flutter/material.dart';
import '../../../core/widgets/base_page.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';

class CharacterDetailsViewAndroid extends StatelessWidget {
  final String characterId;

  const CharacterDetailsViewAndroid({
    super.key,
    required this.characterId,
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: AppStrings.characterDetailsTitle,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://via.placeholder.com/300',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 300,
                      height: 300,
                      color: AppColors.primaryLight,
                      child: const Icon(Icons.person, size: 100),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Personagem $characterId',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Descrição detalhada do personagem. Aqui você encontrará informações sobre o histórico, características e filmes relacionados.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

