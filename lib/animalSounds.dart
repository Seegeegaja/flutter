import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimalSounds extends StatelessWidget {
  const AnimalSounds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: SizedBox( height: 50, width: 50, child: Lottie.asset('lottie/cat.json'),),
        title: Text('Animal Sound',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 5
          ),
        ),
        centerTitle: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.only(top:10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset('image/animal/bear.png', height: 100,),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom : 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      Text('Bear',
                        style: TextStyle(fontSize: 20 , color: Colors.white),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('image/animal/camel.png', height: 100,),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom : 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      Text('Camel',
                        style: TextStyle(fontSize: 20 , color: Colors.white),
                      )

                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset('image/animal/fox.png', height: 100,),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom : 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      Text('Fox',
                        style: TextStyle(fontSize: 20 , color: Colors.white),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('image/animal/koala.png', height: 100,),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom : 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      Text('Koala',
                        style: TextStyle(fontSize: 20 , color: Colors.white),
                      )

                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset('image/animal/lion.png', height: 100,),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom : 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      Text('Lion',
                        style: TextStyle(fontSize: 20 , color: Colors.white),
                      )

                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('image/animal/tiger.png', height: 100,),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom : 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      Text('Tiger',
                        style: TextStyle(fontSize: 20 , color: Colors.white),
                      )

                    ],
                  )
                ],
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
