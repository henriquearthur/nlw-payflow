import 'package:flutter/material.dart';

class DefaultTabLoading extends StatelessWidget {
  const DefaultTabLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
