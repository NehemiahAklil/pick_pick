import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.btnText, required this.onPressedCallback});
  final String btnText;
  final void Function() onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressedCallback,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size.infinite),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
          textStyle: MaterialStateProperty.all<TextStyle>(Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold)),
          alignment: Alignment.center,
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.green.shade900),
        ),
        child: Text(btnText));
  }
}
