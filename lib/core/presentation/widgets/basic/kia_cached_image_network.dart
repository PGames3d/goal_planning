import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';

class KiaCachedImageNetwork extends StatelessWidget {
  const KiaCachedImageNetwork(
      {super.key,
      this.imageURL,
      this.fit,
      this.height,
      this.width,
      this.isCircular = false,
      this.cornerRadius,
      this.border = const Border()});

  final String? imageURL;
  final BoxFit? fit;
  final double? height;
  final double? width;

  ///Only use when required circular image and [cornerRadius] will not work when its value true
  final bool? isCircular;
  final BoxBorder? border;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    return imageURL != null
        ? CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: isCircular == false
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    borderRadius: isCircular == false
                        ? BorderRadius.circular(cornerRadius ?? 0)
                        : null,
                    border: border ??
                        Border.all(
                            color: ColorName.lightGreenButtonColor, width: 1.5),
                    image: DecorationImage(image: imageProvider, fit: fit))),
            fit: fit,
            width: width,
            height: height,
            imageUrl: imageURL ?? "",
            placeholder: (context, url) =>
                Assets.icons.errorImage.image(width: 100, height: 100),
            errorWidget: (context, url, error) =>
                Assets.icons.errorImage.image(width: 100, height: 100),
          )
        : Assets.icons.errorImage.image(
            width: width ?? 100,
            height: height ?? 100); // Placeholder image or any other components
  }
}

/// old code
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:kia_customer/gen/assets.gen.dart';
//
// class KiaCachedImageNetwork extends StatelessWidget {
//   const KiaCachedImageNetwork({super.key, this.imageURL, this.fit, this.height, this.width});
//
//   final String? imageURL;
//   final BoxFit? fit;
//   final double? height;
//   final double? width;
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       fit: fit,
//       width: width,
//       height: height,
//       imageUrl: imageURL ?? '',
//       placeholder: (context, url) => Assets.icons.kiaLogo.image(width: 100, height: 100),
//       errorWidget: (context, url, error) => Assets.icons.kiaLogo.image(width: 100, height: 100),
//     );
//   }
// }
