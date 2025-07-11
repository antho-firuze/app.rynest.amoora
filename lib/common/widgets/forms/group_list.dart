import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    super.key,
    this.title,
    this.showDividerTop = false,
    this.showDividerBottom = true,
    this.showDividerCenter = false,
    this.children,
    this.onTap,
    this.trailing,
  });

  final bool showDividerTop;
  final bool showDividerBottom;
  final bool showDividerCenter;
  final Widget? title;
  final IconData? trailing;
  final List<Widget>? children;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showDividerTop) divider(),
            if (title != null) ...[
              if (showDividerCenter)
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    divider(),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: title!,
                    ),
                  ],
                )
              else
                title!,
            ],
            if (showDividerBottom) divider(),
          ],
        ),
        if (children != null) Column(children: children!),
      ],
    );
  }
}
