import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/home_page/home_page.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:atzos_assignment/screens/home_page/home_page_components/team_components.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeamsList extends StatefulWidget {
  final List<TeamMember> teamList;
  final bool isSmallScreen;
  const TeamsList(
      {super.key, required this.teamList, required this.isSmallScreen});

  @override
  State<TeamsList> createState() => _TeamsListState();
}

class _TeamsListState extends State<TeamsList> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<TeamMember> displayTeam =
        isExpanded ? widget.teamList : widget.teamList.take(3).toList();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      color: const Color(0xffd4dccd),
      child: Column(
        children: [
          const AutoSizeText(
            'Teams',
            maxLines: 1,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          SpacingConstants().heightBetweenFieldsSmall(context),
          if (widget.teamList.isNotEmpty)
            Wrap(
              spacing: MediaQuery.of(context).size.width * 0.1,
              runSpacing: MediaQuery.of(context).size.height * 0.03,
              children: displayTeam.map((member) {
                return widget.isSmallScreen
                    ? TeamComponents().smallTeamWidget(member, context)
                    : TeamComponents().largeTeamWidget(member, context);
              }).toList(),
            ),
          SpacingConstants().heightBetweenFieldsSmall(context),
          SizedBox(
            width: MediaQuery.of(context).size.width <= 900
                ? MediaQuery.of(context).size.width * 0.3
                : MediaQuery.of(context).size.width * 0.15,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(isExpanded ? 'See Less' : 'See More'),
                    Icon(isExpanded
                        ? Icons.arrow_upward_outlined
                        : Icons.arrow_downward_outlined)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
