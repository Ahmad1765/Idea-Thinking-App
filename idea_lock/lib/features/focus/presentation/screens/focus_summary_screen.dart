import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class FocusSummaryScreen extends StatelessWidget {
  const FocusSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          'Focus Summary\n(Phase 1)',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        ),
      ),
    );
  }
}
