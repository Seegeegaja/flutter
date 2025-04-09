import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({super.key});

  void toastMessage(){
    Fluttertoast.showToast(msg: '포스트 메시지');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('image/listview/profile.JPG'),
                backgroundColor: Colors.white,
              ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage('image/listview/profile.JPG'),
                    backgroundColor: Colors.white,
                  )
                ],
                accountName: Text('canu701'),
                accountEmail: Text('wnsdyd821@gmail.com'),
              onDetailsPressed: (){
                print('화살표 누름');
              },
            ),
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.white,
              ),
              title: Text('home',
              style: TextStyle(color: Colors.white),
              ),
              onTap: (){
                print('홈 버튼 누름');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.white,
              ),
              title: Text('Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){
                print('Settings 버튼 누름');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.white,
              ),
              title: Text('Q&A',
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){
                print('question_answer 버튼 누름');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back,
                color: Colors.white,
              ),
              title: Text('뒤로가기',
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        // leading: IconButton(onPressed: (){
        //   print('메뉴버튼 눌림');
        // },
        //     icon: Icon(Icons.menu)
        // ),
        title: Text('AppBar Icon Menu',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
        IconButton(onPressed: (){
          print('쇼핑카트 버튼눌림');
        }, icon: Icon(Icons.shopping_cart),
        ),
          IconButton(onPressed: (){
            print('찾기버튼 눌림');
          },
              icon: Icon(Icons.search),
    ),

        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('스낵바 입니다',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        backgroundColor: Colors.black,
                        duration: Duration(milliseconds: 1000),
                      )
                  );
                },
                child: Text('스낵바')
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape:
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      )
                  ),
                  fixedSize: Size(200, 30),
                  elevation: 0 // 그림자

              ), onPressed: () {
              toastMessage();
            }, child: const Text('토스트 메시지'),
            ),
          ],
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
