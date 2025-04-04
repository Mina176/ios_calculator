import 'package:flutter/material.dart';
import 'package:ios_calculator/constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.symbol,
      required this.color,
      required this.onTap,
      this.onLongPress});
  final Widget symbol;
  final Color color;
  final void Function()? onTap;
  final VoidCallback? onLongPress;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color buttonColor;
  @override
  void initState() {
    buttonColor = widget.color;
    super.initState();
  }

  void onTap() {
    setState(() {
      if (widget.color == kGrey) {
        buttonColor = kGreyOnPressed;
      } else if (widget.color == kPink) {
        buttonColor = kPinkOnPressed;
      } else {
        buttonColor = kBlackOnPressed;
      }
    });
    Future.delayed(Duration(milliseconds: 150), () {
      setState(() {
        buttonColor = widget.color;
      });
    });
    widget.onTap;
  }

  void onLongPressedStart(details) {
    setState(() {
      if (widget.color == kGrey) {
        buttonColor = kGreyOnPressed;
      } else if (widget.color == kPink) {
        buttonColor = kPinkOnPressed;
      } else {
        buttonColor = kBlackOnPressed;
      }
    });
  }

  void onLongPressedEnd() {
    setState(() {
      buttonColor = widget.color;
    });
    widget.onTap;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        widget.onTap!();
      },
      onLongPressDown: onLongPressedStart,
      onLongPressUp: onLongPressedEnd,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150), // Smooth transition
        curve: Curves.easeInOut, // Eases the transition effect
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: widget.symbol,
        ),
      ),
    );
  }
}
