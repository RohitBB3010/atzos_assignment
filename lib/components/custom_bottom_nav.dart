import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded), label: 'Profile')
    ]);
  }
}
