import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserAvatar extends StatelessWidget {
  final String? url;
  final double radius;
  const UserAvatar({Key? key, required this.url, this.radius = 20})
      : super(key: key);

  final minOpacity = 0.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
        child: url != null && url != ''
            ? CachedNetworkImage(
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  );
                },
                imageUrl: url!,
              )
            : Center(
                child: FaIcon(FontAwesomeIcons.user,
                    color: Theme.of(context).colorScheme.secondary,
                    size: radius),
              ),
      ),
    );
  }
}
