import 'package:flutter/material.dart';
import 'package:kias/core/extensions/localization_extension.dart';

import '../../../utils/constants/app_strings.dart';
import 'kia_text.dart';

class KiaPermissionWidget extends StatelessWidget {
  const KiaPermissionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: KiaText(
          context.loc.permissionMessage,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
