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
  late List<String> guessedLetters;
  late int lives;
  late bool gameEnded;
  late StreamController<String> userInputController;

  HangmanGame()
      : guessedLetters = [],
        gameEnded = false {
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
    userInputController = StreamController<String>();
  }

  Future<void> play() async {
    Stream<String> userInputStream = userInputController.stream;

    print('Welcome to Hangman!\n');
    print('Guess the word by entering one letter at a time.\n');

    late StreamSubscription<String> subscription;
    subscription = userInputStream.listen((String input) {
      if (input.length != 1) {
        print('Invalid input. Please enter a single letter.\n');
        return;
      }

      if (gameEnded) {
        return;
      }

      bool letterFound = false;
      for (int i = 0; i < wordToGuess.length; i++) {
        if (wordToGuess[i] == input.toLowerCase()) {
          guessedLetters[i] = wordToGuess[i];
          letterFound = true;
        }
      }

      if (letterFound) {
        print('Correct!\n');
      } else {
        print('\nWrong!\n');
        lives--;
      }

      print('Word: ${guessedLetters.join(' ')}\n');
      print('Lives: $lives\n');

      if (lives == 0 || !guessedLetters.contains('_')) {
        endGame();
        subscription.cancel();
        gameEnded = true;
        userInputController.close();
      }
    });

    while (lives > 0 && guessedLetters.contains('_')) {
      print('Enter a letter: ');
      String? input = await stdin.readLineSync();
      if (input != null) {
        userInputController.add(input.toLowerCase());
      }
    }
  }

  void endGame() {
    if (lives == 0) {
      print('Game Over! You ran out of lives.\n');
    } else {
      print('Congratulations! You guessed the word: $wordToGuess\n');
    }
  }
}
