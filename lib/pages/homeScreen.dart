import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gruber_app/warmwater/view/warmwater_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        scrolledUnderElevation: 0.0,
        title: Text("Home"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          WarmWaterWidget()
        ],
      ),
    );
  }
}
