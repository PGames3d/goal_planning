import 'package:flutter/material.dart';

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final Color? color;

  SearchBarDelegate({required this.child,this.color});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: color ?? Colors.transparent,
      elevation: 0,
      child: child,
    );
  }

  @override
  double get maxExtent => 65.0; // Height of the search bar
  @override
  double get minExtent => 65.0; // Same as max to keep the size consistent
  @override
  bool shouldRebuild(covariant SearchBarDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
