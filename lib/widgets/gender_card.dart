import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.bgColor,
  });
  final String text;
  final IconData icon;
  final Function() onTap;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColor.white, size: 100),
                Text(
                  text,
                  style: TextStyle(color: AppColor.white, fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
