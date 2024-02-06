import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/colors.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;

  const ShimmerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.light
          ? kShimmerLightBase
          : kShimmerDarkBase,
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? kShimmerLightHighlight
          : kShimmerDarkHighlight,
      child: child,
    );
  }
}
