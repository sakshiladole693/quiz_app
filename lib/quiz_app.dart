import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_app_model.dart';

class QuizAppPape extends StatefulWidget {
  const QuizAppPape({super.key});

  @override
  State createState() => _QuizAppPage();
}

class _QuizAppPage extends State {
  List<QuizAppModel> allQuestions = [
    QuizAppModel(
      question: "In which year was the Java programming language released?",
      options: ["1991", "1995", "2000", "1989"],
      correctAnswer: 1,
    ),
    QuizAppModel(
      question: "In which year was Python first released?",
      options: ["1989", "1991", "1995", "2001"],
      correctAnswer: 1,
    ),
    QuizAppModel(
      question: "In which year was the Dart programming language released?",
      options: ["2011", "2014", "2016", "2009"],
      correctAnswer: 0,
    ),
    QuizAppModel(
      question: "In which year was Flutter first released?",
      options: ["2015", "2016", "2017", "2018"],
      correctAnswer: 3,
    ),
    QuizAppModel(
      question: "In which year was the Java programming language released?",
      options: ["1995", "1999", "1992", "2000"],
      correctAnswer: 0,
    ),
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool isQuestionPage = true;
  int score = 0;

  WidgetStatePropertyAll<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex].correctAnswer) {
        if (selectedAnswerIndex ==
            allQuestions[currentQuestionIndex].correctAnswer) {
          score++;
        }
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return WidgetStatePropertyAll(Colors.red);
      } else {
        return WidgetStatePropertyAll(Color.fromARGB(255, 214, 229, 238));
      }
    } else {
      return WidgetStatePropertyAll(Color.fromARGB(255, 214, 229, 238));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isQuestionPage) {
      return quizAppPape();
    } else {
      return resultPage();
    }
  }

  //QuizApp Scaffold
  Scaffold quizAppPape() {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 46, 63),
      body: Column(
        children: [
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 46, 66, 90),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 118,
                vertical: 35,
              ),
              child: const Text(
                "Quiz App",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 214, 229, 238),
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 214, 229, 238),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 80,
            width: 300,
            child: Text(
              allQuestions[currentQuestionIndex].question,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 240, 172, 70),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: checkAnswer(0)),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  selectedAnswerIndex = 0;
                  setState(() {});
                }
              },
              child: Text(
                allQuestions[currentQuestionIndex].options[0],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: checkAnswer(1)),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  selectedAnswerIndex = 1;
                  setState(() {});
                }
              },
              child: Text(
                allQuestions[currentQuestionIndex].options[1],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: checkAnswer(2)),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  selectedAnswerIndex = 2;
                  setState(() {});
                }
              },
              child: Text(
                allQuestions[currentQuestionIndex].options[2],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: checkAnswer(3)),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  selectedAnswerIndex = 3;
                  setState(() {});
                }
              },
              child: Text(
                allQuestions[currentQuestionIndex].options[3],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 46, 66, 90),
        onPressed: () {
          if (selectedAnswerIndex != -1) {
            if (currentQuestionIndex < allQuestions.length - 1) {
              currentQuestionIndex++;
              selectedAnswerIndex = -1;
            } else {
              isQuestionPage = false;
            }
            setState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Please Select any option.....!",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 36, 46, 63),
                  ),
                ),
                backgroundColor: Colors.orangeAccent,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        child: const Icon(Icons.forward, color: Colors.amber, size: 20),
      ),
    );
  }

  //Result Screen Scaffold
  Scaffold resultPage() {
    return Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor: Color.fromARGB(255, 36, 46, 63),
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 46, 66, 90),
      //   centerTitle: true,
      //   title: Text(
      //     "Result Screen",
      //     style: TextStyle(
      //       fontWeight: FontWeight.w700,
      //       color: Colors.white,
      //       fontSize: 25,
      //     ),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: Color.fromARGB(255, 203, 220, 229)
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 133, 183, 209),
                    Color.fromARGB(255, 133, 183, 209),
                    Colors.indigoAccent,
                    const Color.fromARGB(255, 56, 76, 185),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 100,
                    width: 100,
                    "assets/trophy.webp",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Congratulations🥳",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${(score * 100) ~/ allQuestions.length}% Score !",
                    style: TextStyle(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 1, 114, 5),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Score : $score / ${allQuestions.length}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Quiz completed Successfully.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.purple],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    score = 0;
                    currentQuestionIndex = 0;
                    selectedAnswerIndex = -1;
                    isQuestionPage = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                ),
                child: const Text(
                  "Restart Quiz",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
