import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final bool validate, textChange, colorChange;
  final int? falseWidthFactor, trueWidthFactor;
  final String? text;
  final Color? changeColor;
  final VoidCallback? onPressed;

  const CommonButton({
    super.key,
    required this.textChange,
    required this.validate,
    required this.colorChange,
    this.falseWidthFactor,
    this.trueWidthFactor,
    this.text,
    this.changeColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: validate ? onPressed : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: validate ? (falseWidthFactor ?? 1) : (trueWidthFactor ?? 1),
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 300),
              height: 48,
              decoration: BoxDecoration(
                color: validate
                    ? (colorChange
                        ? Theme.of(context).primaryColor
                        : (changeColor ?? Colors.black))
                    : Colors.grey[500],
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: validate ? Colors.black : Colors.white,
                ),
                child: Text(
                  textChange
                      ? (text ?? "Next")
                      : "Please continue creating your account.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: validate ? Colors.white : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
