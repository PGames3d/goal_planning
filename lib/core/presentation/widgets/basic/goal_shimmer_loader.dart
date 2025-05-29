/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../gen/colors.gen.dart';

class GoalShimmerLoader extends StatelessWidget {
  const GoalShimmerLoader({super.key,this.height = 100});
  final double height;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Shimmer.fromColors(baseColor: ColorName.lightGrey, highlightColor:theme.colorScheme.primary,
      child: Container(
        margin :  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8)
        ),
        height: height,
      ),
    );
  }
}
