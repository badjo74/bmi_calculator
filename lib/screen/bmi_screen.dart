import 'package:bmi_calculator/core/colors.dart';
import 'package:bmi_calculator/screen/res_screen.dart';
import 'package:bmi_calculator/widgets/custom_card.dart';
import 'package:bmi_calculator/widgets/gender_card.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int height = 100;
  int weight = 50;
  bool isMale = true;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        title: Text("Bmindex", style: TextStyle(color: AppColor.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            genderType(),
            hightUi(),
            ageWeight(),
            const SizedBox(height: 10),
            caluButton(),
          ],
        ),
      ),
    );
  }

  Expanded genderType() {
    return Expanded(
      child: Row(
        children: [
          GenderCard(
            text: 'Male',
            icon: Icons.male,
            bgColor: isMale ? AppColor.genderColor : AppColor.buttomColor,
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
          ),
          const SizedBox(width: 10),
          GenderCard(
            text: 'Female',
            icon: Icons.female,
            bgColor: isMale ? AppColor.buttomColor : AppColor.genderColor,
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded hightUi() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.genderColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Height',
                style: TextStyle(color: AppColor.white, fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toString(),
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    'cm',
                    style: TextStyle(color: AppColor.white, fontSize: 15),
                  ),
                ],
              ),
              Slider(
                value: height.toDouble(),
                min: 90,
                max: 220,
                activeColor: AppColor.buttomColor,
                inactiveColor: AppColor.gray,
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded ageWeight() {
    return Expanded(
      child: Row(
        children: [
          CustomCard(
            title: 'Weight',
            value: weight,
            onAdd: () {
              setState(() {
                if (weight < 150) {
                  weight++;
                }
              });
            },
            onRemove: () {
              setState(() {
                if (weight > 0) {
                  weight--;
                }
              });
            },
          ),
          SizedBox(width: 10),
          CustomCard(
            title: 'age',
            value: age,
            onAdd: () {
              setState(() {
                if (age < 60) {
                  age++;
                }
              });
            },
            onRemove: () {
              setState(() {
                if (age > 0) {
                  age--;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  SizedBox caluButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          double result = weight / ((height / 100) * (height / 100));
          String resultLabel = getResultLabel(result);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ResScreen(result: result, resultText: resultLabel),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.buttomColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text('Calculate', style: TextStyle(color: AppColor.white)),
      ),
    );
  }
}

String getResultLabel(double bmi) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    return 'Normal Weight';
  } else if (bmi >= 25.0 && bmi <= 29.9) {
    return 'Overweight';
  } else if (bmi >= 30.0 && bmi <= 34.9) {
    return 'High';
  } else if (bmi >= 35.0 && bmi <= 39.9) {
    return 'Very high';
  } else {
    return 'Extremely high';
  }
}
