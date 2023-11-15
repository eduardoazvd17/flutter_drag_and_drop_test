import 'package:flutter/material.dart';
import 'package:flutterdraganddroptest/models/object_model.dart';

class DraggableObjectWidget extends StatelessWidget {
  final ObjectModel model;
  final Offset offset;
  final Function(DraggableDetails) onDragEnd;
  const DraggableObjectWidget({
    super.key,
    required this.model,
    required this.offset,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: Draggable<Container>(
        onDragEnd: onDragEnd,
        feedback: AnimatedOpacity(
          opacity: 0.5,
          duration: const Duration(milliseconds: 300),
          child: model.widget,
        ),
        childWhenDragging: const SizedBox(),
        child: model.widget,
      ),
    );
  }
}
