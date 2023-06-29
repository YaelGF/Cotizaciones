import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {

  final Widget customIputFieldLeft;
  final Widget customIputFieldRight;

  final int flex;

  const CustomRowWidget({
      Key? key,
      this.flex = 1,
      required this.customIputFieldLeft,
      required this.customIputFieldRight
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: flex,
          child: customIputFieldLeft,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: customIputFieldRight,
        ),
      ],
    );
  }
}