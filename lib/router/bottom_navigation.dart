import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Global App Bar')),
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                widget.child.goBranch(
                  0,
                  initialLocation: 0 == widget.child.currentIndex,
                );
              },
              child: Icon(
                Icons.list,
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                widget.child.goBranch(
                  1,
                  initialLocation: 1 == widget.child.currentIndex,
                );
              },
              child: Icon(
                Icons.settings,
                color: _currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
