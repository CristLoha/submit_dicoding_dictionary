import 'package:flutter/material.dart';

class WebMainPage extends StatelessWidget {
  const WebMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Layout Size: ${MediaQuery.of(context).size.width}'),
      ),
    );
  }
}
