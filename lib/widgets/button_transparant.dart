import 'package:flutter/material.dart';
import '../shared/theme.dart';

class ButtonTransparant extends StatelessWidget {
  final VoidCallback onTap;

  final IconData icon;

  const ButtonTransparant({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
