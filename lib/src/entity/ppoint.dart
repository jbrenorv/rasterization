import 'resolution.dart';

class PPoint<T extends num> {
  const PPoint(this.x, this.y);

  final T x;
  final T y;

  factory PPoint.fromMap(Map<String, T> map) {
    return PPoint(map['x']!, map['y']!);
  }

  Map<String, T> toMap() {
    return {
      'x': x,
      'y': y,
    };
  }

  PPoint<int> getRescaledCoordinates(Resolution scale) {
    int xNew = (scale.width * (x + 1)) ~/ 2;
    int yNew = (scale.height * (y + 1)) ~/ 2;
    return PPoint<int>(xNew, yNew);
  }

  @override
  bool operator ==(Object other) {
    return other is PPoint && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => '($x, $y)';
}
