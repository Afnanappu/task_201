import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:task_201/core/app_colors.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0),
      children: [
        AbsorbPointer(
          child: PhysicalShape(
            clipper: ShapeBorderClipper(shape: RoundedRectangleBorder()),
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                index: 1,
                items: <Widget>[
                  Icon(Icons.add_location, size: 30, color: Colors.white),
                  Icon(Icons.alarm, size: 30, color: Colors.white),
                  Icon(Icons.alarm, size: 30, color: Colors.white),
                ],
                onTap: (index) {},
              ),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton.filled(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(Icons.keyboard_alt_rounded),
              ),
              color: Colors.black,
              style: IconButton.styleFrom(
                backgroundColor: AppColors.grey.withValues(alpha: 0.3),
              ),
            ),
            SizedBox(width: 30),
            IconButton.filled(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(Icons.arrow_forward_ios_outlined),
              ),
              color: Colors.black,
              // constraints: BoxConstraints(minWidth: 30),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.grey.withValues(alpha: 0.3),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
