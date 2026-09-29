import 'package:flutter/material.dart';

class ZerausLogo extends StatelessWidget {
  final bool compact;
  final Color? textColor;

  const ZerausLogo({
    super.key,
    this.compact = false,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = textColor ?? Colors.white;
    final markSize = compact ? 38.0 : 62.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: markSize,
          height: markSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(markSize * .3),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF13C8FF), Color(0xFF1478F8)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF168DFF).withValues(alpha: .35),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Z',
              style: TextStyle(
                color: Colors.white,
                fontSize: compact ? 27 : 43,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                height: 1,
              ),
            ),
          ),
        ),
        SizedBox(width: compact ? 10 : 14),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ZERAUS',
              style: TextStyle(
                color: foreground,
                fontSize: compact ? 17 : 29,
                height: 1,
                fontWeight: FontWeight.w900,
                letterSpacing: compact ? 1.3 : 2.2,
              ),
            ),
            SizedBox(height: compact ? 3 : 5),
            Text(
              'TECH',
              style: TextStyle(
                color: const Color(0xFF19B9FF),
                fontSize: compact ? 8 : 12,
                height: 1,
                fontWeight: FontWeight.w800,
                letterSpacing: compact ? 3.5 : 5.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
