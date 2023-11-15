import 'package:flutter/material.dart';
import 'package:flutterdraganddroptest/widgets/draggable_object_widget.dart';

import 'models/object_model.dart';

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
            DraggableObjectWidget(
              model: ObjectModel(
                id: 'circle',
                color: Colors.red[100]!,
                shape: BoxShape.circle,
              ),
              offset: object1Postition,
              onDragEnd: (details) => setState(() {
                object1Postition = details.offset;
              }),
            ),
            DraggableObjectWidget(
              model: ObjectModel(
                id: 'rectangle',
                color: Colors.blue[100]!,
                shape: BoxShape.rectangle,
              ),
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
}
