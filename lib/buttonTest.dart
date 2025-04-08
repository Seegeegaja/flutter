import 'package:flutter/material.dart';
import 'package:flutter_study/layout/myAppBar.dart';

class ButtonTest extends StatelessWidget {
  const ButtonTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(pageTitle: 'button Test'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
                //   RoundedRectangleBorder(
                //   borderRadius: BorderRadius.zero
                // )
              ),
                onPressed: (){
                print('눌림');
                },
                child: const Text('ElevatedButton')
            ),
            SizedBox(height: 10,),
            FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.purple,
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
                  print('필드 버튼눌림');
                },
                child: const Text('Filled Button')
            ),
            SizedBox(height: 10,),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                  backgroundColor: Colors.white
                ),
                onPressed: ()=>{},
                child: Text('Text Button')
            ),
            SizedBox(height: 10,),
            IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.home_rounded,
                  size: 40,
                  color: Colors.blue,
                )
            )
          ],
        ),
      ),
      // FloatingActionButton 은 scaffold 맨 마지막에
      floatingActionButton:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.all(
                  Radius.circular(60)
                )
            ),
            onPressed: (){},
            child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,

          ),
          ),
          SizedBox(height: 10,),
          FloatingActionButton.extended(
            heroTag: 'btn2',
            label: Text('뒤로가기',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.all(
                    Radius.circular(30)
                )
            ),
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,

            ),
          ),
        ],
      ),
    );
  }
}
