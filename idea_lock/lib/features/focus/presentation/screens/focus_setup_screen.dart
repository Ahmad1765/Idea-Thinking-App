import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class FocusSetupScreen extends StatelessWidget {
  const FocusSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          'Focus Setup\n(Phase 1)',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        ),
      ),
    );
  }
}
