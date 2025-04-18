import 'package:flutter/material.dart';
import 'package:task_201/core/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryColorA.withValues(alpha: 0.9),
            AppColors.primaryColorB.withValues(alpha: 0.9),
          ],
        ),
      ),
      child: child,
    );
  }
}
