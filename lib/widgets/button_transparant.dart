import 'package:flutter/material.dart';
import '../shared/theme.dart';

class ButtonTransparant extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? color;
  const ButtonTransparant({
    Key? key,
    required this.onTap,
    required this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            child: Icon(
              icon,
              color: color ?? whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
