import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  /*
  // positional argument, cant give modifiers
  const AnswerButton(
    this.answerText,
    this.onTap, {
    super.key,
  });
  */
  // named argument
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return button1(answerText, onTap);
  }

  Widget button1(String answerText, Function() onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget button2(String answerText, Function() onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.blue),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            // side: const BorderSide(color: Colors.red),
          ),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
