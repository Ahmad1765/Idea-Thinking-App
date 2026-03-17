import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ChatScreen extends StatelessWidget {
  final String matchId;
  const ChatScreen({super.key, required this.matchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Chat')),
      body: Center(
        child: Text(
          'Chat: $matchId\n(Phase 1)',
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 18),
        ),
      ),
    );
  }
}
