import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/base_page.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';

class HomeViewAndroid extends StatelessWidget {
  const HomeViewAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: AppStrings.homeTitle,
      actions: [
        IconButton(
          icon: const Icon(Icons.chat),
          onPressed: () => context.go('/chat'),
          tooltip: 'Chat',
        ),
      ],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 80, color: AppColors.primary),
            const SizedBox(height: 24),
            Text(
              'Bem-vindo à Home',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () => context.push('/character/1'),
              icon: const Icon(Icons.person),
              label: const Text('Ver Personagens'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => context.push('/film/1'),
              icon: const Icon(Icons.movie),
              label: const Text('Ver Filmes'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

