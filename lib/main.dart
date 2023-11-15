import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset object1Postition = const Offset(100, 100);
  Offset object2Postition = const Offset(200, 200);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drag & Drop Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Stack(
          children: [
            _draggableObject(
              color: Colors.blue[100],
              offset: object1Postition,
              onDragEnd: (details) => setState(() {
                object1Postition = details.offset;
              }),
            ),
            _draggableObject(
              color: Colors.green[100],
              offset: object2Postition,
              onDragEnd: (details) => setState(() {
                object2Postition = details.offset;
              }),
            ),
          ],
        ),
      ),
    );
  }

  _draggableObject({
    required Color? color,
    required Offset offset,
    required Function(DraggableDetails) onDragEnd,
  }) {
    const itemSize = Size(140, 75);
    final container = Container(
      height: itemSize.height,
      width: itemSize.width,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
    );

    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: Draggable<Container>(
        onDragEnd: onDragEnd,
        feedback: AnimatedOpacity(
          opacity: 0.5,
          duration: const Duration(milliseconds: 300),
          child: container,
        ),
        childWhenDragging: const SizedBox(),
        child: container,
      ),
    );
  }
}
