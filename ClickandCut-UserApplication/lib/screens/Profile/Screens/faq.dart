import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is Flutter?',
      answer:
          'Flutter is an open-source UI software development kit created by Google. It allows developers to build natively compiled applications for mobile, web, and desktop from a single codebase.',
    ),
    FAQItem(
      question: 'How do I get started with Flutter?',
      answer:
          'You can get started with Flutter by installing the Flutter SDK, setting up your development environment, and creating a new Flutter project. Flutter provides detailed documentation and guides on their official website.',
    ),
    FAQItem(
      question: 'Can I use Flutter for web development?',
      answer:
          'Yes, Flutter supports web development through Flutter for Web. You can use Flutter to build web applications that run in modern web browsers.',
    ),
    FAQItem(
      question: 'What programming languages does Flutter use?',
      answer:
          'Flutter primarily uses the Dart programming language. Dart is a modern, object-oriented language with features like strong typing, asynchronous programming, and a reactive framework.',
    ),
    FAQItem(
      question: 'Is Flutter suitable for building production apps?',
      answer:
          'Yes, Flutter is suitable for building production-quality applications. Many popular apps, including those from Google, Alibaba, and others, use Flutter for their user interfaces.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "FAQ",
          style: TextStyle(
            fontSize: 20,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [
                  Color(0xFF6f4fc1),
                  Color(0xFF904088),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ExpansionTile(
              title: Text(
                faqItems[index].question,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    faqItems[index].answer,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
