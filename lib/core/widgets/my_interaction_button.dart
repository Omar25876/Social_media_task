import 'package:flutter/material.dart';
import 'package:social_media_feed/core/utils/app_colors.dart';

class MyInteractionButton extends StatelessWidget {
  final IconData icon;
  final int number;
  final Function() onPressed;

  const MyInteractionButton(
      {super.key,
        required this.icon,
        required this.number,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(500),
      color: Colors.grey.shade300,
      child: InkWell(
        borderRadius: BorderRadius.circular(500),
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(),
          height: 40,
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.primary, size: 25),
              const SizedBox(
                width: 5,
              ),
              Text(
                "$number",
                style: const TextStyle(fontSize: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}