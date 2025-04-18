import 'package:flutter/material.dart';
import 'package:task_201/core/app_colors.dart';

class ChatBottomBar extends StatelessWidget {
  const ChatBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // clipper: FabClipper(),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Row(
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
      ),
    );
  }
}

// Custom Clipper for circular cutout at top center
class FabClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = 30.0; // Half of FAB size (default FAB diameter ~56dp)
    final centerX = size.width / 2;

    // Start at top-left, offset by radius for cutout depth
    path.moveTo(0, radius);
    // Line to start of cutout
    path.lineTo(centerX - radius, radius);
    // Circular cutout
    path.arcToPoint(
      Offset(centerX + radius, radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );
    // Continue to top-right
    path.lineTo(size.width, radius);
    // Rest of the container
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
