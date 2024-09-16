import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TeamComponents {
  Widget smallTeamWidget(TeamMember member, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.06,
            backgroundColor: Colors.amber,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.08,
            ),
          ),
          SpacingConstants().widthBetweenFieldsMid(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                member.userName,
                maxLines: 1,
                style: const TextStyle(fontSize: 20.0),
              ),
              if (member.designation != null)
                AutoSizeText(
                  member.designation!,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 15.0),
                )
            ],
          )
        ],
      ),
    );
  }

  Widget largeTeamWidget(TeamMember member, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.025,
            backgroundColor: Colors.amber,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          SpacingConstants().heightBetweenFieldsSmall(context),
          AutoSizeText(
            member.userName,
            maxLines: 1,
            style: const TextStyle(fontSize: 20.0),
          ),
          if (member.designation != null)
            AutoSizeText(
              member.designation!,
              maxLines: 1,
              style: const TextStyle(fontSize: 15.0),
            ),
        ],
      ),
    );
  }
}
