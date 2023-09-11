import 'package:flutter/material.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Layout Size: ${MediaQuery.of(context).size.width}'),
      ),
    );
  }
}
