import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTap extends StatelessWidget {
  const NavTap({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.selectedIcon,
  });

  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isSelected ? 1 : 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
