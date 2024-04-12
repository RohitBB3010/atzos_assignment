import 'package:atzos_assignment/components/custom_appbar.dart';
import 'package:atzos_assignment/components/custom_bottom_nav.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Post', context: context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Lottie.asset('assets/development.json'),
            AutoSizeText(
              'This page is under development. We hope to get it to you soon',
              maxLines: 2,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
