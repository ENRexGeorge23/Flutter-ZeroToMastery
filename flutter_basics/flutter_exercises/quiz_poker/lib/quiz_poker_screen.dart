import 'package:flutter/material.dart';
import 'package:quiz_poker/add_question_widget.dart';
import 'package:quiz_poker/question_detail_screen.dart';
import 'package:quiz_poker/question_item_widget.dart';

class QuizPokerScreen extends StatefulWidget {
  const QuizPokerScreen({super.key});

  @override
  State<QuizPokerScreen> createState() => _QuizPokerScreenState();
}

class _QuizPokerScreenState extends State<QuizPokerScreen> {
  @override
  final List<Question> questions = [
    Question(
      category: 'Sports',
      questionText: 'What is the most popular sport in the world?',
      questionImage: const NetworkImage(
          'https://webunwto.s3.eu-west-1.amazonaws.com/2020-01/sport-congresse.jpg'),
      hint1: 'It involves a ball',
      hint2: 'Played in many different countries',
      solution: 'Football (Soccer)',
    ),
    Question(
      category: 'Science',
      questionText: 'What is the symbol for the element Iron?',
      questionImage: const NetworkImage(
          'https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?w=2000'),
      hint1: 'It is represented by two letters',
      hint2: 'Its atomic number is 26',
      solution: 'Fe',
    ),

    Question(
      category: 'Movies',
      questionText:
          'Who played the role of Iron Man in the Marvel Cinematic Universe?',
      questionImage: const NetworkImage(
          'https://hips.hearstapps.com/hmg-prod/images/best-valentines-movies-1675040306.jpg?crop=0.934xw:1.00xh;0.0337xw,0&resize=1200:*'),
      hint1: 'He is known for his charismatic portrayal',
      hint2: "His character's name is Tony Stark",
      solution: 'Robert Downey Jr.',
    ),

    Question(
      category: 'Geography',
      questionText: 'Which city is known as the "Eternal City"?',
      questionImage: const NetworkImage(
          'https://www.australia.com/content/australia/en_us/places/sydney-and-surrounds/guide-to-sydney/_jcr_content/image.adapt.1200.HIGH.jpg'),
      hint1: 'It is the capital of Italy',
      hint2: 'Home to famous landmarks like the Colosseum and Vatican City',
      solution: 'Rome',
    ),

    Question(
      category: 'Music',
      questionText: 'Which band released the hit song "Bohemian Rhapsody"?',
      questionImage: const NetworkImage(
          'https://images.macrumors.com/t/vMbr05RQ60tz7V_zS5UEO9SbGR0=/1600x900/smart/article-new/2018/05/apple-music-note.jpg'),
      hint1: 'Their lead vocalist was Freddie Mercury',
      hint2: 'They are known for their theatrical performances',
      solution: 'Queen',
    ),

    Question(
      category: 'History',
      questionText:
          'In which year did the United States declare independence from Great Britain?',
      questionImage:
          const NetworkImage('https://www.mooc.org/hubfs/history.jpg'),
      hint1: 'It was during the 18th century',
      hint2: 'The Declaration of Independence was signed on July 4th',
      solution: '1776',
    ),
    // Add more questions here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Poker'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionDetailPage(
                        question: questions[index],
                      ),
                    ),
                  ),
              child: QuestionItem(question: questions[index]));
        },
      ),
      floatingActionButton: AddQuestionWidget(
        questions: questions,
        onQuestionAdded: (question) {
          setState(() {
            questions.add(question);
          });
        },
      ),
    );
  }
}

class Question {
  final String category;
  final String questionText;
  final NetworkImage? questionImage;
  final String hint1;
  final String hint2;
  final String solution;

  Question({
    required this.category,
    required this.questionText,
    required this.questionImage,
    required this.hint1,
    required this.hint2,
    required this.solution,
  });
}
