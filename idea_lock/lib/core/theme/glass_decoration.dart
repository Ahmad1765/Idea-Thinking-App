import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

BoxDecoration glassDecoration({
  double radius = 16,
  Color? borderColor,
  double borderWidth = 1,
}) {
  return BoxDecoration(
    color: AppColors.surfaceGlass,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(
      color: borderColor ?? AppColors.glassBorder,
      width: borderWidth,
    ),
    boxShadow: const [
      BoxShadow(color: Colors.black45, blurRadius: 20),
    ],
  );
}

/// Wraps a child in a glassmorphism card with BackdropFilter blur.
class GlassCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  const GlassCard({
    super.key,
    required this.child,
    this.radius = 16,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: padding,
          decoration: glassDecoration(radius: radius, borderColor: borderColor),
          child: child,
        ),
      ),
    );
  }
}
