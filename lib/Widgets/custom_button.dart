import 'package:flutter/material.dart';
import 'package:zoom_clone/Utils/colors.dart';

class CustomButton extends StatefulWidget {
  final String line;
  final VoidCallback OnPressed;
  const CustomButton({
    Key? key,
    required this.line,
    required this.OnPressed,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ElevatedButton(
        onPressed: widget.OnPressed,
        child: Text(
          widget.line,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            minimumSize: const Size(
              double.infinity,
              50,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
