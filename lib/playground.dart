import 'dart:math';

// TODO: learning sub project idea -> set up as a package
class FileStorageEngine {}

void playground() {
  Point point_1 = new Point(10.0, 12.3);
}

/* -- -- -- -- -- -- Class -- -- -- -- -- -- */

abstract class Figure {
  const Figure();

  double getArea();
}

class Canvas {
  const Canvas();

  //
}

class Point {
  // final variables can be set at runtime and only need to be set once
  final double x, y;

  // Use this only when there is a name conflict. Otherwise, Dart style omits the this.
  Point(this.x, this.y);

  // NOTE: also have access to static variables
  static double distanceBetween(Point a, Point b) {
    double dx = a.x - b.x;
    double dy = a.y - b.y;

    return sqrt(dx * dx + dy * dy);
  }
}

/* -- -- -- -- -- -- Enum -- -- -- -- -- -- */

enum Color { red, blue }

extension FooBarExt on Color {
  String get displayColor {
    switch (this) {
      case Color.blue:
        return "foo bar baz";
      case Color.red:
        return "red awesome";
    }
  }
}

Color clr = Color.red;
final str = clr.displayColor;
