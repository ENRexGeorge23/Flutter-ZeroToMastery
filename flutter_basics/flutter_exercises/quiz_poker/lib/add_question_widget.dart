import 'package:flutter/material.dart';
import 'package:quiz_poker/quiz_poker_screen.dart';

class AddQuestionWidget extends StatelessWidget {
  final List<Question> questions;
  final Function(Question) onQuestionAdded;

  const AddQuestionWidget({
    Key? key,
    required this.questions,
    required this.onQuestionAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            TextEditingController categoryController = TextEditingController();
            TextEditingController questionController = TextEditingController();
            TextEditingController imageController = TextEditingController();
            TextEditingController hint1Controller = TextEditingController();
            TextEditingController hint2Controller = TextEditingController();
            TextEditingController solutionController = TextEditingController();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Add New Question',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: questionController,
                    decoration: const InputDecoration(
                      labelText: 'Question Text',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: imageController,
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Create a new question and add it to the list
                      final newQuestion = Question(
                        category: categoryController.text,
                        questionText: questionController.text,
                        questionImage: NetworkImage(imageController.text),
                        hint1: hint1Controller.text,
                        hint2: hint2Controller.text,
                        solution: solutionController.text,
                      );

                      Navigator.of(context).pop();

                      if (newQuestion.category.isNotEmpty &&
                          newQuestion.questionText.isNotEmpty) {
                        onQuestionAdded(newQuestion);
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
