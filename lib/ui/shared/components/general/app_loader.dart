import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/_constants.dart';

class AppLoader extends StatelessWidget {
  final Color? color;
  final double? padding;
  final double? size;
  const AppLoader({
    super.key,
    this.color = AppColors.white,
    this.padding,
    this.size = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding ?? 5),
        child: SizedBox(
          height: size,
          width: size,
          child: Platform.isAndroid
              ? CircularProgressIndicator(
                  color: color,
                )
              : CupertinoActivityIndicator(color: color, radius: 13),
        ),
      ),
    );
  }
}
