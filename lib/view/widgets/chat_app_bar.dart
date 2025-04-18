import 'package:flutter/material.dart';
import 'package:task_201/core/app_colors.dart';
import 'package:task_201/view/screens/home_screen.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton.outlined(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        icon: Icon(Icons.close),
        color: Colors.black,
        style: IconButton.styleFrom(
          side: BorderSide(color: AppColors.grey.withValues(alpha: 0.3)),
        ),
      ),
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset('assets/chat_logo.png', height: 40),
        title: const Text('JOHN DOE'),
        subtitle: const Text('Online'),
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
