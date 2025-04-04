import 'package:flutter/material.dart';
import 'package:ios_calculator/constants.dart';

class CustomLandscapeButton extends StatefulWidget {
  const CustomLandscapeButton(
      {super.key,
      required this.symbol,
      required this.color,
      required this.onTap,
      this.onLongPress});
  final Widget symbol;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  State<CustomLandscapeButton> createState() => _CustomLandscapeButtonState();
}

class _CustomLandscapeButtonState extends State<CustomLandscapeButton> {
  late Color buttonColor;
  @override
  void initState() {
    buttonColor = widget.color;
    super.initState();
  }

  void onTapAnimation() {
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
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapAnimation();
        widget.onTap();
      },
      onLongPressDown: onLongPressedStart,
      onLongPressUp: () {
        onLongPressedEnd();
        widget.onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150), // Smooth transition
        curve: Curves.easeInOut, // Eases the transition effect
        decoration: ShapeDecoration(
          shape: StadiumBorder(), //  StadiumBorder,
          color: buttonColor,
        ),
        child: Center(
          child: widget.symbol,
        ),
      ),
    );
  }
}
