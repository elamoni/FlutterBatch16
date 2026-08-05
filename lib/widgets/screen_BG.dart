import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/asset_path.dart';
class ScreenBg extends StatelessWidget {
  final Widget child;
  const ScreenBg({ super.key, required this.child

  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          SafeArea(child: SvgPicture.asset(
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
              AssetPath.backgroundSVG
          ),),
          child
    ],
    );
  }
}
