import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.5,
      color: Theme.of(context).primaryColorDark,
    );
  }
}
