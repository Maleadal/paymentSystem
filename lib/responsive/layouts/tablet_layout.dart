import 'package:flutter/material.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T A B L E T"),
      ),
    );
  }
}
