import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: QuizPokerScreen(),
    );
  }
}

class QuizPokerScreen extends StatelessWidget {
  final List<Question> questions = [
    Question(
      category: 'Sports',
      questionText: 'What is the most popular sport in the world?',
      questionimage: NetworkImage(
          'https://webunwto.s3.eu-west-1.amazonaws.com/2020-01/sport-congresse.jpg'),
    ),

    Question(
      category: 'Music',
      questionText: 'Who is the lead singer of the band "Coldplay"?',
      questionimage: NetworkImage(
          'https://images.macrumors.com/t/vMbr05RQ60tz7V_zS5UEO9SbGR0=/1600x900/smart/article-new/2018/05/apple-music-note.jpg'),
    ),
    Question(
      category: 'Geography',
      questionText: 'What is the capital city of Australia?',
      questionimage: NetworkImage(
          'https://www.australia.com/content/australia/en_us/places/sydney-and-surrounds/guide-to-sydney/_jcr_content/image.adapt.1200.HIGH.jpg'),
    ),

    Question(
      category: 'Science',
      questionText: 'What is the chemical symbol for gold?',
      questionimage: NetworkImage(
          'https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?w=2000'),
    ),

    Question(
      category: 'Movies',
      questionText: 'Who directed the movie "Inception"?',
      questionimage: NetworkImage(
          'https://hips.hearstapps.com/hmg-prod/images/best-valentines-movies-1675040306.jpg?crop=0.934xw:1.00xh;0.0337xw,0&resize=1200:*'),
    ),

    Question(
      category: 'History',
      questionText: 'In which year did World War II end?',
      questionimage: NetworkImage('https://www.mooc.org/hubfs/history.jpg'),
    ),

    Question(
      category: 'Technology',
      questionText: 'Who co-founded Apple Inc. along with Steve Jobs?',
      questionimage: NetworkImage(
          'https://www.simplilearn.com/ice9/free_resources_article_thumb/What_is_the_Importance_of_Technology.jpg'),
    ),

    Question(
      category: 'Food',
      questionText: 'What is the main ingredient in guacamole?',
      questionimage: NetworkImage(
          'https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200'),
    ),

    Question(
      category: 'Literature',
      questionText: 'Who wrote the novel "To Kill a Mockingbird"?',
      questionimage: NetworkImage(
          'https://images.penguinrandomhouse.com/cover/9780446310789'),
    ),

    Question(
      category: 'Sports',
      questionText: 'Which country won the FIFA World Cup in 2018?',
      questionimage: NetworkImage(
          'https://webunwto.s3.eu-west-1.amazonaws.com/2020-01/sport-congresse.jpg'),
    ),

    Question(
      category: 'Music',
      questionText: 'Who is the lead guitarist of the band "Queen"?',
      questionimage: NetworkImage(
          'https://images.macrumors.com/t/vMbr05RQ60tz7V_zS5UEO9SbGR0=/1600x900/smart/article-new/2018/05/apple-music-note.jpg'),
    ),

    Question(
      category: 'Animals',
      questionText: 'What is the largest species of shark?',
      questionimage: NetworkImage(
          'https://a-z-animals.com/media/tiger_laying_hero_background.jpg'),
    ),

    // Add more questions here...
  ];

  QuizPokerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Poker'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Large screen, display items horizontally
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return QuestionItem(question: questions[index]);
              },
            );
          } else {
            // Small screen, display items vertically
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return QuestionItem(question: questions[index]);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('FAB pressed'),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Question {
  final String category;
  final String questionText;
  final NetworkImage? questionimage;

  Question(
      {required this.category,
      required this.questionText,
      required this.questionimage});
}

class QuestionItem extends StatelessWidget {
  final Question question;

  const QuestionItem({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(question.category),
      subtitle: Text(question.questionText),
      leading: question.questionimage != null
          ? CircleAvatar(
              backgroundImage: question.questionimage,
              radius: 30,
            )
          : null,
    );
  }
}
