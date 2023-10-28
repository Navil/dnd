import 'package:flutter/material.dart';

class AdaptiveLoadingIndicator extends StatelessWidget {
  final double? value;

  const AdaptiveLoadingIndicator({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(value: value),
    );
  }
}
