import 'package:flutter/material.dart';

class LoadingStateWarmWaterWidget extends StatelessWidget {
  const LoadingStateWarmWaterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 70,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
