import 'package:animated_bottom_sheet/animated_bottom_sheet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Bottom Sheet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AnimatedBottomSheetScreen(),
    );
  }
}

class AnimatedBottomSheetScreen extends StatefulWidget {
  const AnimatedBottomSheetScreen({super.key});

  @override
  State<AnimatedBottomSheetScreen> createState() =>
      _AnimatedBottomSheetScreenState();
}

class _AnimatedBottomSheetScreenState extends State<AnimatedBottomSheetScreen> {
  void _openBottomSheet() {
    CustomBottomSheet.open(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,

      bottomSheetContentBuilder: (StateSetter setModalState) {
        return Container(
          height: 300,
          color: Colors.teal,
          child: Center(
            child: TextButton(
              onPressed: () {
                setModalState(() {});
              },
              child: Text("test"),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("main.dart");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Animated Bottom Sheet'),
      ),
      body: Center(
        child: TextButton(onPressed: _openBottomSheet, child: Text('open bottom sheet')),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
