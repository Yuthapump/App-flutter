import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Function()? onPress;

  const MenuItem({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Icon(
            icon,
            size: 56,
            color: color,
          ),
          Text(label),
        ],
      ),
    );
  }
}
