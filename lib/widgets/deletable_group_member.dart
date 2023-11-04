import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeletableGroupMember extends ConsumerStatefulWidget {
  final String userId;
  final String? pictureUrl;
  final Function onTap;

  const DeletableGroupMember(
      {super.key,
      required this.userId,
      required this.pictureUrl,
      required this.onTap});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeletableGroupMemberState();
}

class _DeletableGroupMemberState extends ConsumerState<DeletableGroupMember> {
  bool _inDeletion = false;

  @override
  Widget build(BuildContext context) {
    final currentUserId =
        ref.watch(loggedInUserProvider.select((value) => value.id));
    final isMe = currentUserId == widget.userId;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.matrix(
                _inDeletion ? _grayedOutMatrix : _normalMatrix),
            child: UserAvatar(
              url: widget.pictureUrl,
              radius: 40,
            ),
          ),
          if (!isMe)
            Positioned(
                top: -10,
                right: -10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      color: _inDeletion
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.error,
                      icon: _inDeletion
                          ? const FaIcon(FontAwesomeIcons.arrowRotateLeft)
                          : const FaIcon(
                              FontAwesomeIcons.xmark,
                            ),
                      onPressed: () {
                        widget.onTap();
                        setState(() {
                          _inDeletion = !_inDeletion;
                        });
                      }),
                )),
        ],
      ),
    );
  }
}

List<double> _normalMatrix = [
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
];

List<double> _grayedOutMatrix = [
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0
];
