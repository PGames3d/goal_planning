import 'package:flutter/material.dart';

import '../../../../gen/colors.gen.dart';

class HeartButton extends StatelessWidget {
  final bool isLiked;
  final VoidCallback? onFavoriteClick;

  const HeartButton({super.key, required this.isLiked, this.onFavoriteClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onFavoriteClick,
        child: isLiked
            ? const Icon(Icons.favorite, color: ColorName.redColor, size: 22)
            : const Icon(Icons.favorite_border_rounded,
                color: ColorName.redColor, size: 22));
  }
}
