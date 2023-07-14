void main() {
  List<double> exampleList = [1, 2, 3, 4, 5];

  print('List: $exampleList');

  print(exampleList[1]);
  print(exampleList[0]);

  print(exampleList.length);
  print(exampleList.first);
  exampleList.add(6);
  print(exampleList);

  Map exampleMap = {
    'key1': 23,
    'key2': 'value2',
    'key3': 'value3',
  };

  print(exampleMap);
  print(exampleMap['key1']);
  print(exampleMap.length);
  print(exampleMap.keys);
}
