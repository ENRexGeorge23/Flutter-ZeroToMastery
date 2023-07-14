void main() {
  List<int> numberList = [3, 4, 5, 6, 7, 8, 9];
  List<int> secondList = [];

  numberList.forEach((element) {
    element++;
    print(element);
    secondList.add(element);
  });

  print(numberList);
  print(secondList);
}
