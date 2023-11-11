import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MemberCount extends StatelessWidget {
  final int number;
  final MemberType memberType;
  const MemberCount(
      {super.key, required this.number, required this.memberType});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (memberType) {
      case MemberType.dm:
        iconData = FontAwesomeIcons.book;
        break;
      case MemberType.member:
        iconData = FontAwesomeIcons.peopleGroup;
        break;
      case MemberType.player:
        iconData = FontAwesomeIcons.diceD20;
        break;
    }
    FontAwesomeIcons.peopleGroup;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              number.toString(),
              style: const TextStyle()
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          FaIcon(iconData)
        ],
      ),
    );
  }
}

enum MemberType { member, dm, player }
