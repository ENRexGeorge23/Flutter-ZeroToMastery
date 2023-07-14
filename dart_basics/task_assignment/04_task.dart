import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int randomNumber = random.nextInt(100) + 1;
  int? guess;
  int tries = 0;

  print("Welcome to the Number Guessing Game!");

  do {
    stdout.write("Guess the number (between 1 and 100): ");
    String input = stdin.readLineSync()!;
    guess = int.tryParse(input);

    if (guess != null && guess >= 1 && guess <= 100) {
      tries++;
      if (guess < randomNumber) {
        //add hints
        print("Too low! Try again.");
      } else if (guess > randomNumber) {
        //add hints
        print("Too high! Try again.");
      }
      print("Number of tries: $tries");
    } else {
      print("Invalid input. Please enter a number between 1 and 100.");
    }
  } while (guess != randomNumber);

  print(
      "Congratulations! The correct number is $randomNumber and you guessed it in $tries tries.");
}
