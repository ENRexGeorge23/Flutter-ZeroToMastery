import "dart:io";

void main() {
  int number;

  while (true) {
    stdout.write("Enter a valid number: ");
    number = int.parse(stdin.readLineSync()!);
    if (number >= 0) {
      break;
    } else {
      print("Invalid number");
    }
  }

  int calculateFaculty(int number) {
    if (number == 0 || number == 1) {
      return 1;
    } else {
      int result = 1;
      for (int i = 2; i <= number; i++) {
        result *= i;
      }
      return result;
    }
  }

  int faculty = calculateFaculty(number);
  print("The calculated faculty of $number is $faculty");
}
