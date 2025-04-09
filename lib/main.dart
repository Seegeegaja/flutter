import 'package:flutter/material.dart';
import 'package:flutter_study/animalSounds.dart';
import 'package:flutter_study/buttonTest.dart';
import './layout/myAppBar.dart';
import 'appBarMenu.dart';
import 'characterCard.dart';
import 'loginPage.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.purpleAccent),
      title: 'Flutter Study',
      home: const Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: MyAppBar(pageTitle: '내가보내고 싶은거!!',),
      body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TextMenu(
                titleText: '1. Button Test Page',
                openWidget: ButtonTest(),
              ),
              SizedBox(height: 10,),
              //image/character_card/
              _TextMenu(
                titleText: '2. Character Card Page',
                openWidget: CharacterCard(),
              ),
              SizedBox(height: 10,),
              _TextMenu(
                titleText: '3. Animal Sound Page',
                openWidget: AnimalSounds(),
              ),
              SizedBox(height: 10,),
              _TextMenu(
                titleText: '4. AppBarMenu',
                openWidget: AppBarMenu(),
              ),
              SizedBox(height: 10,),
              _TextMenu(
                titleText: '5. Dice Programming',
                openWidget: LoginPage(),
              ),
            ],
          ),
        ),
    );
  }
}

class _TextMenu extends StatelessWidget {
  const _TextMenu({super.key, this.titleText, this.openWidget});
  final titleText;
  final openWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> openWidget)
          );
          print('버튼 눌림');
        },
        child: Text(titleText,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
    );
  }
}
