void main() {
  final Car redCar = Car(color: 'red', engine: 'v8');
  print(redCar.color);
}

class Car {
  Car({required this.color, required this.engine});
  final String color;
  final String engine;

  void drive() {
    print('$color car is moving');
  }

  void whichColor() {
    print('car color: $color');
  }
}
