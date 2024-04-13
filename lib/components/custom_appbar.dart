import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required this.titleText,
    required this.context,
  }) : super(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          elevation: 1.0,
          backgroundColor: Colors.white,
          shape:
              Border(bottom: BorderSide(color: Colors.black.withOpacity(0.7))),
          leadingWidth: MediaQuery.of(context).size.width * 0.08,
          title: Row(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.02,
                child: Image.asset('assets/spyn_logo.jpeg'),
              ),
              SpacingConstants().widthBetweenFieldsSmall(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    titleText,
                    style: const TextStyle(fontSize: 25.0),
                  ),
                  AutoSizeText(
                    'Star Academy',
                    style: TextStyle(
                        fontSize: 20.0, color: Colors.black.withOpacity(0.7)),
                  ),
                ],
              ),
            ],
          ),
          actions: MediaQuery.of(context).size.width > 700
              ? [
                  TextButton(
                      onPressed: () {},
                      child: const AutoSizeText(
                        'Home',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      )),
                  TextButton(
                    onPressed: () {},
                    child: const AutoSizeText(
                      'Posts',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.green)),
                    child: const AutoSizeText(
                      'Login',
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ]
              : [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.green)),
                    child: const AutoSizeText(
                      'Login',
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
        );

  final String titleText;
  final BuildContext context;
}
