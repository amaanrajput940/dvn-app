import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.width, this.height, this.radius_})
      : super(key: key);

  final double? width, height;

  final double? radius_;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
