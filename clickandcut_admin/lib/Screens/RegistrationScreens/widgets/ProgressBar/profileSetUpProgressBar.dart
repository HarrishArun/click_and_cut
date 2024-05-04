import 'package:flutter/material.dart';

class ProfileSetUpProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProfileSetUpProgressBar({
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = (currentStep / totalSteps) * 100;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < totalSteps+1; i++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  width: 20.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: i <= currentStep ? Colors.purple : Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: i == currentStep
                        ? [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Progress: ${currentStep+1} / ${totalSteps+1}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
