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
 final List _items = ['test item'];

  void _openBottomSheet() {
    AnimatedBottomSheet.open(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,

      bottomSheetContentBuilder: (StateSetter setModalState) {
        return Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    _items.add('new test item');
                    setModalState(() {});
                  },
                  child: Text("add item"),
                ),
                TextButton(
                  onPressed: () {
                    _items.removeLast();
                    setModalState(() {});
                  },
                  child: Text("remove item"),
                ),
                Column(
                  children: List.generate(_items.length, (index) {
                    return Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        _items[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  }),
                ),
              ],
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
        child: TextButton(
          onPressed: _openBottomSheet,
          clipBehavior: Clip.antiAlias,
          child: const Text('open bottom sheet'),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
