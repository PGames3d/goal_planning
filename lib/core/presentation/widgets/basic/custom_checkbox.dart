import 'package:flutter/material.dart';
class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final double? width;
  final double? height;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.height,
    this.width,
    this.onChanged,
  });

  void _toggleCheck() {
    if (onChanged != null) {
      onChanged!(!value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheck,
      child: Container(
        height: height ?? 18,
        width: width ?? 18,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(3),
          color: Theme.of(context).cardColor,
        ),
        child: value
            ? Center(
          child: Icon(
            Icons.check_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: ((height ?? 18) - 3),
          ),
        )
            : null,
      ),
    );
  }
}
