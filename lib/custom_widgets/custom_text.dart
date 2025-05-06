import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CText extends StatelessWidget {
  const CText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.size,
    this.overflow,
    this.underlined,
    this.centered,
  });

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final bool? overflow;
  final bool? underlined;
  final bool? centered;

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: TextStyle(fontSize: size ?? 12)),
      textDirection: TextDirection.ltr,
    )..layout();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          textAlign: centered == true ? TextAlign.center : TextAlign.start,
          overflow:
              overflow == true ? TextOverflow.ellipsis : TextOverflow.visible,
          style: GoogleFonts.poppins(
            decoration: TextDecoration.none,
            textStyle: TextStyle(
              color: color ?? Theme.of(context).hintColor,
              fontSize: size ?? 12,
              fontWeight: fontWeight ?? FontWeight.normal,
              decorationThickness: 2.0,
              decorationColor: color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
        underlined == true
            ? Container(
              height: 1, // Thickness of underline
              width:
                  textPainter.width +
                  10, // Match underline width with text width
              color:
                  color ?? Theme.of(context).primaryColor, // Color of underline
              margin: EdgeInsets.only(
                top: 1,
              ), // Adjust space between text and underline
            )
            : SizedBox.shrink(),
      ],
    );
  }
}
