import 'package:flutter/material.dart';

extension ContrastingColor on Color {
  Color getContrastingColor() {
    // Check if the color is close to white or black
    if (this == Colors.white) {
      return Colors.black;
    } else if (this == Colors.black) {
      return Colors.white;
    }

    // Convert the color to HSV
    final hsv = HSVColor.fromColor(this);

    // Adjust the hue by 180 degrees (for contrast)
    final contrastHue = (hsv.hue + 180) % 360;

    // Keep the same saturation and value (brightness)
    final contrastingColor = hsv.withHue(contrastHue).toColor();

    return contrastingColor;
  }
}
