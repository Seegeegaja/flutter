import 'package:flutter/material.dart';

class AnimalSounds extends StatelessWidget {
  const AnimalSounds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
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
            padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Center(
                      child: Image.asset(
                          'image/animal/bear.png',
                        width: 100,
                        height: 150,
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.white,
                      thickness: 1,
                      endIndent: 30,
                    ),
                    Text('Bear',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 30,
                      ),
                    ),
                  SizedBox(height: 20,),
                  Center(
                    child: Image.asset(
                      'image/animal/camel.png',
                      width: 100,
                      height: 150,
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 30,
                  ),
                  Text('Camel',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Image.asset(
                      'image/animal/fox.png',
                      width: 100,
                      height: 150,
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 30,
                  ),
                  Text('Fox',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20,),

                ],

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'image/animal/koala.png',
                      width: 100,
                      height: 150,
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 30,
                  ),
                  Text('Koala',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Image.asset(
                      'image/animal/lion.png',
                      width: 100,
                      height: 150,
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 30,
                  ),
                  Text('Lion',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Image.asset(
                      'image/animal/tiger.png',
                      width: 100,
                      height: 150,
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 30,
                  ),
                  Text('Tiger',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20,),

                ],

              )
            ],
          ),
        ),
      
    );
  }
}
