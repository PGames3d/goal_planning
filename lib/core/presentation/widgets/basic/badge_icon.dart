import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final int badgeCount;

  const BadgeIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none, // Ensures the badge is visible outside bounds
        children: [
          Icon(
            icon,
            size: 32.0, // Adjust the icon size as needed
          ),
          if (badgeCount > 0)
            Positioned(
              right: -6, // Position the badge
              top: -6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red, // Badge background color
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badgeCount > 99 ? '99+' : '$badgeCount', // Display badge count
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12, // Font size of badge text
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}