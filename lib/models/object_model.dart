import 'package:flutter/material.dart';

class ObjectModel {
  final String id;
  final Color color;
  final BoxShape shape;

  ObjectModel({
    required this.id,
    required this.color,
    required this.shape,
  });

  Size get size => switch (shape) {
        BoxShape.rectangle => const Size(140, 75),
        BoxShape.circle => const Size(75, 75),
      };

  Widget get widget => Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius:
              shape == BoxShape.rectangle ? BorderRadius.circular(10) : null,
          shape: shape,
          color: color,
        ),
      );
}
