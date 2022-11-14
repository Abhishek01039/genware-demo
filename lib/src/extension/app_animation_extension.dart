import 'package:flutter/widgets.dart';

extension AppAnimationEx on Widget {
  Widget effectOpacity({required double opacity, Duration? duration}) =>
      AnimatedOpacity(
        duration: duration ?? const Duration(milliseconds: 350),
        opacity: opacity,
        child: this,
      );
}
