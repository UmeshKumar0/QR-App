import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  MyCustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon});

  String text;
  Function onPressed;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48.0,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
            width: 48.0,
            height: 48.0,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 8.0,
                    spreadRadius: 2.0)
              ],
              color: Colors.deepPurple,
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Align(
                alignment: Alignment.center,
                child: Icon(icon, color: Colors.white))),
      ),
    );
  }
}
