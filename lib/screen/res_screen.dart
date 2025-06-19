import 'package:bmi_calculator/core/colors.dart';
import 'package:flutter/material.dart';

class ResScreen extends StatelessWidget {
  const ResScreen({super.key, required this.result, required this.resultText});
  final double result;
  final String resultText ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        foregroundColor: AppColor.white,
        title: const Text("Result", style: TextStyle(color: AppColor.white)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your Result',
              style: TextStyle(color: AppColor.white, fontSize: 35),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.gray,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 103, 255, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 100),
                    Text(
                      result.toStringAsFixed(2),
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 100),
                    const Text(
                      'You have a normal body weight. Good job!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColor.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.buttomColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Recalculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
