import 'package:atzos_assignment/constants/spacing_constants.dart';
import 'package:atzos_assignment/screens/home_page/home_page.dart';
import 'package:atzos_assignment/screens/home_page/home_page_classes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
        isExpanded ? widget.teamList! : widget.teamList.take(3).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              'Teams',
              maxLines: 1,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: const AutoSizeText('See More'))
          ],
        ),
        SpacingConstants().heightBetweenFieldsSmall(context),
        if (widget.teamList.isNotEmpty)
          Wrap(
            spacing: MediaQuery.of(context).size.width * 0.1,
            runSpacing: MediaQuery.of(context).size.height * 0.03,
            children: displayTeam.map((member) {
              return widget.isSmallScreen
                  ? const HomePage().smallTeamWidget(member, context)
                  : const HomePage().largeTeamWidget(member, context);
            }).toList(),
          )
      ],
    );
  }
}
