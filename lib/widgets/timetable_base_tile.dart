import 'package:flutter/material.dart';

@immutable
class TimetableBaseTile extends StatelessWidget {
  final Color backgroundColor;
  final Color? borderColor;
  final Widget? child;

  const TimetableBaseTile({
    super.key,
    required this.backgroundColor,
    this.borderColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AspectRatio(
        aspectRatio: 0.75,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                    width: 1,
                  )
                : null,
            borderRadius: BorderRadius.circular(4),
          ),
          child: child,
        ),
      ),
    );
  }
}
