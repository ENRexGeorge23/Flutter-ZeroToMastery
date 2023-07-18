import 'package:flutter/material.dart';
import 'package:quiz_poker/quiz_poker_screen.dart';

class AddQuestionPage extends StatelessWidget {
  final List<Question> questions;
  final Function(Question) onQuestionAdded;
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController hint1Controller = TextEditingController();
  final TextEditingController hint2Controller = TextEditingController();
  final TextEditingController solutionController = TextEditingController();

  AddQuestionPage({
    Key? key,
    required this.questions,
    required this.onQuestionAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Question'),
      ),
      body: Padding(
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
            const SizedBox(height: 8),
            TextField(
              controller: hint1Controller,
              decoration: const InputDecoration(
                labelText: 'Hint 1',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: hint2Controller,
              decoration: const InputDecoration(
                labelText: 'Hint 2',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: solutionController,
              decoration: const InputDecoration(
                labelText: 'Solution',
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

                if (newQuestion.category.isNotEmpty &&
                    newQuestion.questionText.isNotEmpty) {
                  onQuestionAdded(newQuestion);
                }

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
