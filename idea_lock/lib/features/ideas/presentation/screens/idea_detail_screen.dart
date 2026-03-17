import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class IdeaDetailScreen extends StatelessWidget {
  final String ideaId;
  const IdeaDetailScreen({super.key, required this.ideaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Idea Detail')),
      body: Center(
        child: Text(
          'Idea: $ideaId\n(Phase 1)',
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 18),
        ),
      ),
    );
  }
}
