import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.onAdd,
    required this.onRemove,
    required this.value,
  });
  final String title;
  final int value;
  final Function() onAdd;
  final Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.genderColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(color: AppColor.white, fontSize: 20),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: onRemove,

                    icon: Icon(Icons.remove),
                    style: IconButton.styleFrom(backgroundColor: AppColor.gray),
                  ),
                  SizedBox(width: 10),
                  IconButton.filled(
                    onPressed: onAdd,
                    icon: Icon(Icons.add),

                    style: IconButton.styleFrom(backgroundColor: AppColor.gray),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
