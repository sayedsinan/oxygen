import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final bool showArrow;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? contentAlignment;

  const MyButton({
    super.key,
    this.width = 150,
    this.height = 45,
    required this.text,
    this.onPressed,
    this.showArrow = true,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.textStyle,
    this.padding,
    this.contentAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final Color finalBackgroundColor = backgroundColor ?? const Color(0xFFE91E63);
    final Color finalTextColor = textColor ?? Colors.white;
    final double finalBorderRadius = borderRadius ?? 10;
    final TextStyle finalTextStyle =
        textStyle ?? TextStyle(color: finalTextColor, fontSize: 16);
    final EdgeInsetsGeometry finalPadding = padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
    final MainAxisAlignment finalAlignment = contentAlignment ?? MainAxisAlignment.center;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: finalBackgroundColor,
          foregroundColor: finalTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(finalBorderRadius),
          ),
          padding: finalPadding,
        ),
        child: Row(
          mainAxisAlignment: finalAlignment,
          children: [
            Text(
              text,
              style: finalTextStyle,
            ),
            if (showArrow) ...[
              const Spacer(),
              Icon(Icons.arrow_circle_down, size: 13, color: finalTextColor),
            ],
          ],
        ),
      ),
    );
  }
}
