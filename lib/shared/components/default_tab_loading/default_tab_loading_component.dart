import 'package:flutter/material.dart';

class DefaultTabLoadingComponent extends StatelessWidget {
  const DefaultTabLoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
