import 'package:atzos_assignment/screens/home_page/home_page.dart';
import 'package:atzos_assignment/screens/post_page/post_page.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded), label: 'Profile'),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
            break;

          case 1:
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const PostPage()),
                (route) => false);
            break;
        }
      },
    );
  }
}
