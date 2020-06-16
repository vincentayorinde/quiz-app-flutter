import 'package:flutter/material.dart';
import 'quiz.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scores = [];

  Quiz quizClass = Quiz();

  bool completed = false;

  void checkAnswer(bool userAnswer) {
    bool correctAns = quizClass.getQuestionAnswer();
    setState(() {
      if (quizClass.nextQuestion() == true) {
        print('next question');
        print(quizClass.nextQuestion());
        completed = true;
        if (userAnswer == correctAns) {
          scores.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      } else {
        print('setting marks');
        if (userAnswer == correctAns) {
          scores.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildQuestionsPage();
  }

  Column buildQuestionsPage() {
    if (completed) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset('assets/completed.svg', width: 500.0),
                    Text(
                      'You have successfully completed the quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue.shade500,
                  onPressed: () {
                    setState(() {
                      completed = false;
                      scores = [];
                      quizClass.startOver();
                    });
                  },
                  child: Text(
                    'Start Over',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          SafeArea(
            child: Row(
              children: scores,
            ),
          )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizClass.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.green.shade500,
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.red.shade500,
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          SafeArea(
            child: Row(
              children: scores,
            ),
          )
        ],
      );
    }
  }
}
