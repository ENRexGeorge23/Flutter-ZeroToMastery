void main() {
  int age = 18;
  print('You are $age years old');

  if (age >= 18) {
    print('You can enter the movie');
  } else if (age >= 13) {
    print('You can enter the movie with a parent');
  } else {
    print('You cannot enter the movie');
  }
}
