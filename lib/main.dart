import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 17,
                        color: const Color.fromARGB(255, 201, 198, 198),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset("assets/image/cuate.png"),
              Text(
                'Stay Organized',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Text(
                'Group your tasks and keep\n them organized',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF999999),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF999999),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF999999),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Colors.black,width: 10),
                  color: Color(0xFF8BA8B5),
                ),

                // color: Colors.red
                width: 317,
                height: 54,
                child: Text('NEXT', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),

      // body:
    );
  }
}
