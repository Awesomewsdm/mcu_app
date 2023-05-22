import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

bool isButtonClicked = false;

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isButtonClicked = true;
            });
          },
          child: AnimatedContainer(
            height: 80,
            width: 80,
            duration: const Duration(seconds: 5),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: isButtonClicked ? Colors.yellow : Colors.pink,
              border: Border.all(
                color: isButtonClicked ? Colors.white : Colors.transparent,
                width: 2,
              ),
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: isButtonClicked ? Colors.black : Colors.white,
                ),
                child: const Text('My Button'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
