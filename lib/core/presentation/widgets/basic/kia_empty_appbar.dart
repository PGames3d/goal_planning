import 'package:flutter/material.dart';

class KiaEmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KiaEmptyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
    );
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}
