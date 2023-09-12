import 'package:flutter/material.dart';

class WebMain extends StatelessWidget {
  const WebMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Layout Size: ${MediaQuery.of(context).size.width}'),
      ),
    );
  }
}
