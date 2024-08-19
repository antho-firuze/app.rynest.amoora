import 'package:flutter/material.dart';

class LeftRight extends StatelessWidget {
  const LeftRight({
    super.key,
    this.left,
    this.right,
    this.lWidth,
    this.padding,
    this.children = const <Widget>[],
  });

  final Widget? left;
  final Widget? right;
  final double? lWidth;
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    var tRight = right ?? Container();
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: children.isNotEmpty
          ? Row(
              mainAxisAlignment: lWidth != null ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisAlignment: lWidth != null ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                lWidth != null ? SizedBox(width: lWidth, child: left) : left ?? Container(),
                lWidth != null ? Expanded(child: tRight) : tRight,
              ],
            ),
    );
  }
}
