import 'questions.dart';

class Quiz {
  int _questionNumber = 0;

  List<Question> _questionList = [
    Question(qtn: 'Serena Williams has one more singles tennis Grand Slam titles than sister Venus', ans: true),
    Question(qtn: 'The tutorial was very enjoyable', ans: true),
    Question(qtn: 'You are using this app right now, you\'ve got no choice',ans: true),
    Question(qtn: 'You are in a relationship', ans: false),
    Question(qtn: 'Gin is typically included in a Long Island Iced Tea', ans: true),
    Question(qtn: 'Monaco is the smallest country in the world', ans: false),
    Question(qtn: 'Australia is wider than the moon', ans: true),
    Question(qtn: 'Queen Elizabeth II is currently the second longest reigning British monarch', ans: false),
  ];


  dynamic nextQuestion(){
    if(_questionNumber < _questionList.length - 1){
      print(_questionNumber);
      _questionNumber++;
    }else{
      bool completed = true;
      return completed;
    }
  }

  String getQuestionText(){
    return _questionList[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questionList[_questionNumber].questionAnswer;
  }

  int startOver(){
    return _questionNumber = 0;
  }
}
