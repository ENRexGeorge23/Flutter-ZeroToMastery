// ignore_for_file: unused_local_variable

void main(List<String> args) {
  final (first, last) = records();
  print(first);
  print(last);

  final describedDate = describeDate(DateTime.now());
  print(describedDate);

  final soundOfAnimal = whatDoesItSounds(Cat());
  print(soundOfAnimal);

  final soundOfAnimals = whatDoesItSounds(Lion());
  print(soundOfAnimals);
}

String describeDate(DateTime dt) => switch (dt.weekday) {
      1 => 'Feeling Relaxe after weekend?',
      6 || 7 => 'Enjoying weekend?',
      _ => 'Working hard',
    };

(String, String) records() {
  final firstName = 'John';
  final lastName = 'Doe';

  return (firstName, lastName);
}

String whatDoesItSounds(Animal animal) => switch (animal) {
      Cat c => 'Meow',
      Dog d => 'Woof',
      Lion l => 'Roar',
      Cow a => 'Moo',
      Horse h => 'Neigh',
    };

sealed class Animal {}

class Cat extends Animal {}

class Dog extends Animal {}

class Lion extends Animal {}

class Cow extends Animal {}

class Horse extends Animal {}
