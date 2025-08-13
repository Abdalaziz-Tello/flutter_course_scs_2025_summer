import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScorePage());
  }
}

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [Colors.yellow, Colors.pinkAccent]),
        ),

        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Icon(
                Icons.stop_circle_outlined,
                size: 200,
                color: Colors.purple,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 100),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x50FFFFFF),
                    ),
                    width: 200,
                    height: 200,
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0x90FFFFFF),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Text("Your Score Is"),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  width: 305,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.yellow],
                    ),
                  ),
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(20),
                    // shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 60
                    ),
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "* 100%",
                            style: TextStyle(color: Colors.purple),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text("Completion"),
                          ),
                        ],
                      ),Column(

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "* 100%",
                            style: TextStyle(color: Colors.purple),
                          ),
                          Text("Completion"),
                        ],
                      ),Column(

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "* 100%",
                            style: TextStyle(color: Colors.purple),
                          ),
                          Text("Completion"),
                        ],
                      ),Column(

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "* 100%",
                            style: TextStyle(color: Colors.purple),
                          ),
                          Text("Completion"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                        Text("Share Again")
                      ],
                    ),Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){
                          SharePlus.instance.share(ShareParams(
                            text: 
                        """
                        I Install Quiz Flutter App , it is very interteing app
                        And I Get a Score About {Score}


                        please install the app and try it with me 
                        """
                  
                          ));
                        }, icon: Icon(Icons.share)),
                        Text("Share Again")
                      ],
                    ),Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                        Text("Share Again")
                      ],
                    ),Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                        Text("Share Again")
                      ],
                    ),Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                        Text("Share Again")
                      ],
                    ),Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                        Text("Share Again")
                      ],
                    ),
                  ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
