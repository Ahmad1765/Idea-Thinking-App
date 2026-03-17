import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ThreadScreen extends StatelessWidget {
  final String postId;
  const ThreadScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Thread')),
      body: Center(
        child: Text(
          'Post: $postId\n(Phase 2)',
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 18),
        ),
      ),
    );
  }
}
