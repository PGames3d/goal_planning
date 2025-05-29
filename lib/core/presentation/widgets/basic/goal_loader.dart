/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

import 'package:flutter/material.dart';

class GoalLoader extends StatelessWidget {
  const GoalLoader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Positioned.fill(
      child: Stack(
        children: [
          const Positioned(
            child: ModalBarrier(
              dismissible: false,
            ),
          ),
          Center(child: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
          ),),
        ],
      ),
    );
  }
}
