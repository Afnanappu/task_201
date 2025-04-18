import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart'
    as clipper;
import 'package:task_201/core/app_colors.dart';
import 'package:task_201/view/screens/chat_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper.OvalBottomBorderClipper(),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColorA.withValues(alpha: 0.9),
              AppColors.primaryColorB.withValues(alpha: 0.9),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton.outlined(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              color: Colors.white,
              style: IconButton.styleFrom(
                side: BorderSide(color: Colors.white),
              ),
            ),
            Text(
              'Flash Card',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 50),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}
