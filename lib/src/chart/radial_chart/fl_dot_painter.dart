import 'dart:ui';

import 'package:equatable/equatable.dart';

/// This class contains the interface that all DotPainters should conform to.
abstract class FlDotPainter with EquatableMixin {
  /// This method should be overridden to draw the dot shape.
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas);

  /// This method should be overridden to return the size of the shape.
  Size getSize(FlSpot spot);
}

/// Represents a conceptual position in cartesian (axis based) space.
class FlSpot with EquatableMixin {
  final double x;
  final double y;

  /// [x] determines cartesian (axis based) horizontally position
  /// 0 means most left point of the chart
  ///
  /// [y] determines cartesian (axis based) vertically position
  /// 0 means most bottom point of the chart
  FlSpot(double x, double y)
      : x = x,
        y = y;

  /// Copies current [FlSpot] to a new [FlSpot],
  /// and replaces provided values.
  FlSpot copyWith({
    double? x,
    double? y,
  }) {
    return FlSpot(
      x ?? this.x,
      y ?? this.y,
    );
  }

  ///Prints x and y coordinates of FlSpot list
  @override
  String toString() {
    return '(' + x.toString() + ', ' + y.toString() + ')';
  }

  /// Used for splitting lines, or maybe other concepts.
  static FlSpot nullSpot = FlSpot(double.nan, double.nan);

  /// Determines if [x] or [y] is null.
  bool isNull() => this == nullSpot;

  /// Determines if [x] and [y] is not null.
  bool isNotNull() => !isNull();

  /// Used for equality check, see [EquatableMixin].
  @override
  List<Object?> get props => [
        x,
        y,
      ];

  /// Lerps a [FlSpot] based on [t] value, check [Tween.lerp].
  static FlSpot lerp(FlSpot a, FlSpot b, double t) {
    if (a == FlSpot.nullSpot) {
      return b;
    }

    if (b == FlSpot.nullSpot) {
      return a;
    }

    return FlSpot(
      lerpDouble(a.x, b.x, t)!,
      lerpDouble(a.y, b.y, t)!,
    );
  }
}
