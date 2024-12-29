import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    super.key,
    this.header,
    this.children,
    this.onTap,
    this.trailing,
  });

  final Widget? header;
  final IconData? trailing;
  final List<Widget>? children;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        divider(),
        if (header != null) header!,
        if (children != null) ...children!,
      ],
    );
  }
}
