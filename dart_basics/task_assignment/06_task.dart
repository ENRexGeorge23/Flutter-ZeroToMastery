import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() {
  HangmanGame hangman = HangmanGame();
  hangman.play();
}

class HangmanGame {
  late List<String> words;
  late Random random;
  late String wordToGuess;
  late List<String>
      guessedLetters; // Marking it as 'late' to allow initialization in the constructor
  late int lives;

  HangmanGame() : guessedLetters = [] {
    words = [
      'hangman',
      'programming',
      'computer',
      'game',
      'dart',
      'sadness',
      'challenge',
      'learning',
      'fun',
      'word'
    ];
    random = Random();
    wordToGuess = words[random.nextInt(words.length)];
    guessedLetters = List.filled(wordToGuess.length, '_');
    lives = 10;
  }

  Future<void> play() async {
    final StreamController<String> userInputController =
        StreamController<String>();
    Stream<String> userInputStream = userInputController.stream;

    stdout.write('Welcome to Hangman!\n');
    stdout.write('Guess the word by entering one letter at a time.\n');

    late StreamSubscription<String> subscription;
    subscription = userInputStream.listen((String input) {
      if (input.length != 1) {
        stdout.write('Invalid input. Please enter a single letter.\n');
        return;
      }

      bool letterFound = false;
      for (int i = 0; i < wordToGuess.length; i++) {
        if (wordToGuess[i] == input) {
          guessedLetters[i] = input;
          letterFound = true;
        }
      }

      if (letterFound) {
        stdout.write('Correct!\n');
      } else {
        stdout.write('Wrong!\n');
        lives--;
      }

      stdout.write('Word: ${guessedLetters.join(' ')}\n');
      stdout.write('Lives: $lives\n');

      if (lives == 0 || !guessedLetters.contains('_')) {
        endGame();
        subscription.cancel();
        userInputController.close();
      }
    });

    while (lives > 0 && guessedLetters.contains('_')) {
      stdout.write('Enter a letter: ');
      String? input = await stdin.readLineSync();
      if (input != null) {
        userInputController.add(input.toLowerCase());
      }
    }
  }

  void endGame() {
    if (lives == 0) {
      stdout.write('Game Over! You ran out of lives.\n');
    } else {
      stdout.write('Congratulations! You guessed the word: $wordToGuess\n');
    }
  }
}
