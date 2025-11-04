import 'package:flutter/material.dart';
import '../../../core/widgets/base_page.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';

class FilmDetailsViewAndroid extends StatelessWidget {
  final String filmId;

  const FilmDetailsViewAndroid({
    super.key,
    required this.filmId,
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: AppStrings.filmDetailsTitle,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://via.placeholder.com/400',
                  width: 400,
                  height: 600,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 400,
                      height: 600,
                      color: AppColors.primaryLight,
                      child: const Icon(Icons.movie, size: 100),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Filme $filmId',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sinopse: Descrição detalhada do filme. Aqui você encontrará informações sobre a trama, diretor, elenco e personagens relacionados.',
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

