import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final bool showAppBar;
  final Widget? floatingActionButton;

  const BasePage({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.showAppBar = true,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: showAppBar
          ? AppBar(
              title: title != null ? Text(title!) : null,
              actions: actions,
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            )
          : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

