import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.symbol,
      required this.color,
      required this.onTap, this.onLongPress});
  final Widget symbol;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: GestureDetector(
        onTap: onTap,
        onLongPress:onLongPress ,
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(64)),
          child: Center(
            child: symbol,
          ),
        ),
      ),
    );
  }
}
