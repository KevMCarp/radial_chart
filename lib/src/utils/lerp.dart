import '../../radial_chart.dart';

List<T>? _lerpList<T>(List<T>? a, List<T>? b, double t,
    {required T Function(T, T, double) lerp}) {
  if (a != null && b != null && a.length == b.length) {
    return List.generate(a.length, (i) {
      return lerp(a[i], b[i], t);
    });
  } else if (a != null && b != null) {
    return List.generate(b.length, (i) {
      return lerp(i >= a.length ? b[i] : a[i], b[i], t);
    });
  } else {
    return b;
  }
}

/// Lerps [double] list based on [t] value, allows [double.infinity].
double? lerpDoubleAllowInfinity(double? a, double? b, double t) {
  if (a == b || (a?.isNaN == true) && (b?.isNaN == true)) {
    return a?.toDouble();
  }

  if (a!.isInfinite || b!.isInfinite) {
    return b;
  }
  assert(a.isFinite, 'Cannot interpolate between finite and non-finite values');
  assert(b.isFinite, 'Cannot interpolate between finite and non-finite values');
  assert(t.isFinite, 't must be finite when interpolating between values');
  return a * (1.0 - t) + b * t;
}

/// Lerps [RadialChartSectionData] list based on [t] value, check [Tween.lerp].
List<RadialChartSectionData>? lerpRadialChartSectionDataList(
        List<RadialChartSectionData>? a,
        List<RadialChartSectionData>? b,
        double t) =>
    _lerpList(a, b, t, lerp: RadialChartSectionData.lerp);
