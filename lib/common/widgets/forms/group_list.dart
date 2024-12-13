import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    super.key,
    this.title,
    this.children,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.onTap,
    this.trailing,
  });

  final EdgeInsetsGeometry padding;
  final String? title;
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
        10.height,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Padding(
                padding: padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                    ).bold(),
                    if (trailing != null) ...[
                      10.width,
                      Icon(trailing).link(onTap: onTap),
                    ],
                  ],
                ),
              ),
            ],
            if (children != null) ...[
              10.height,
              ListView(
                shrinkWrap: true,
                padding: padding,
                physics: const NeverScrollableScrollPhysics(),
                children: children!.toList(),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
