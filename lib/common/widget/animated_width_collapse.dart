import 'package:flutter/material.dart';



class AnimatedWidthCollapse extends StatelessWidget {
  const AnimatedWidthCollapse({
    Key? key,
    required this.visible,
    required this.child,
    required this.duration,
  }) : super(key: key);

  final bool visible;
  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      child: Container(
        constraints: visible
            ? const BoxConstraints(
                maxWidth: double.infinity,
              )
            : const BoxConstraints(
                maxWidth: 0,
              ),
        child: visible
            ? child
            : Container(),
      ),
    );
  }
}
