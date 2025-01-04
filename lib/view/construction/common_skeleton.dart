import 'package:flutter/material.dart';

class CommonSkeleton extends StatelessWidget {
  final Widget body;

  const CommonSkeleton({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: body,
    );
  }
}
