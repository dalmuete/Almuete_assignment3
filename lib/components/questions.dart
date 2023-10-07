
import 'package:assignment_3/data/questions_list.dart';
import 'package:assignment_3/main.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
int questionIndex = 0;
int score = 0;
bool isFinished = false;

void checkAnswer(String selectedAnswer) {
    String correctAnswer = questionList[questionIndex]['correctAnswer'];
     if (selectedAnswer == correctAnswer) {
      setState(() {
        score++;
      });
    }
    nextQuestion();
  }

    
void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      setState(() {
        isFinished = true;
      });
    }
  }

    Widget build(BuildContext context) {
    if (isFinished) {
      return showscores();
    } else {
      return showquestions();
    }
  }

  Widget showquestions(){
    final currentQuestion = questionList[questionIndex];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion['questionText'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ...currentQuestion['answers'].map((answer) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(30),
                      alignment: Alignment.centerLeft
                    ),
                    onPressed: () {
                      checkAnswer(answer);
                    },
                    child: Text(answer),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget showscores(){
    return Center(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children:  [
          if (score <= 5) ...[
            const Text('You Failed',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            ),
          ] else if(score <= 8)...[
            const Text('That\'s good',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              ),
            ),
          ] else ...[
            const Text('Perfect',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            ),
          ],

          Text('${score}/${questionList.length}',
          style: TextStyle(
            color: Colors.green.shade700,
            fontWeight: FontWeight.w700,
            fontSize: 50,
          ),
          ),
        
            ElevatedButton(
              onPressed: (){},
              child: IconButton(
              icon: Icon(Icons.repeat), 
              onPressed:(){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizApp()),
                );
              },
            ),
          ),
        ],    
      ),
    );
  }
}