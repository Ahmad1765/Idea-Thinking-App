import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class IdeaCreateScreen extends StatelessWidget {
  const IdeaCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          'Create Idea\n(Phase 1)',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        ),
      ),
    );
  }
}
