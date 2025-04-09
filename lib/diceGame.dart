import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  //좌우 주시위 값을 저장하는 변수
  int leftDice = 1;
  int rightDice = 1;
  void showToast(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 20,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Dice Game',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body:
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image(image: AssetImage('image/dice/dice$leftDice.png'),
                        width: 200,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Image(image: AssetImage('image/dice/dice$rightDice.png'),
                          width: 200,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 60,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape:
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              )
                          ),
                          fixedSize: Size(200, 30),
                          elevation: 0 // 그림자
                        //   RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.zero
                        // )
                      ),
                      onPressed: (){
                        //두개 난수 발생
                        setState(() {
                          leftDice = Random().nextInt(6)+1;
                          rightDice = Random().nextInt(6)+1;
                        });
                        //토스트 메시지 보이기
                        showToast(
                            'Left Dice : ${leftDice} , Right Dice : ${rightDice}'
                        );

                      },
                      child: const Text('주사위 던지기')
                  ),
                ],
              ),
            ),
          ),


      floatingActionButton:
      FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
