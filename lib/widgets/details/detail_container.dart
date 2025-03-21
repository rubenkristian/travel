import 'package:flutter/material.dart';

class DetailContainer extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  const DetailContainer({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: child,
        ),
      ),
    );
  }
}
