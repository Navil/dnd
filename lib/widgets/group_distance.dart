import 'dart:math';

import 'package:dnd/utils/distance_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupDistance extends ConsumerWidget {
  final num distanceInMeters;
  final bool isMeters = true;
  const GroupDistance(this.distanceInMeters, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Transform to km, if it is <= 0, 0.1 so it ceils to <1
    var km = max(distanceInMeters / 1000, 0.1);

    String unit = "km";
    var distance = km;
    if (!isMeters) {
      distance = kmToMile(km);
      unit = "mi";
    }

    return Text("< ${distance.ceil()} $unit");
  }
}
