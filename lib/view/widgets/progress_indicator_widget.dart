import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_201/core/app_colors.dart';
import 'package:task_201/view_models/progress_card_provider.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Everyday Phrases',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        Consumer<ProgressCardProvider>(
          builder:
              (context, progress, child) => Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: AppColors.grey.withValues(alpha: 0.3),
                    strokeCap: StrokeCap.round,
                    color: AppColors.primaryColorB,
                    strokeWidth: 10,
                    value: progress.current / progress.total,
                    strokeAlign: 2.0,
                  ),
                  Text(
                    '${progress.current}/${progress.total}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
        ),
      ],
    );
  }
}
