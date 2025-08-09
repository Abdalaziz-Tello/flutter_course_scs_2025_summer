import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// List<dynamic> HabifOfContext = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // HabifOfContext.add(context);
    return MaterialApp(home: SplashScreen());
  }
}

// ? Data : Model : state
List<String> names = ["Ahmad", "Noor", "Yaser", "Ruba", "Rama", "Banan"];

class WhatsappMainPage extends StatelessWidget {
  const WhatsappMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // HabifOfContext.add(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.large(
          // label: Text("data"),
          backgroundColor: Colors.green,
          child: Icon(Icons.chat, color: Colors.white),
          onPressed: () {
            names.add("Walled");
            print(names);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WhatsappMainPage()),
            );
            // Navigator.pop(context);
          },
        ),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          bottom: TabBar(
            dividerColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelColor: Colors.white,
            tabs: [
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          ),
          backgroundColor: Colors.green,
          title: Text("Whatsapp", style: TextStyle(color: Colors.white)),
        ),
        body: TabBarView(
          children: [
            ChatsTile(),
            Container(),
            Container(color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}

class ChatsTile extends StatelessWidget {
  const ChatsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => Divider(),
      itemCount: names.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(names[index]),
        subtitle: Text("pleas text me when you can"),
        leading: CircleAvatar(child: Icon(Icons.person)),
        trailing: Icon(Icons.dataset),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, const Color.fromARGB(255, 40, 146, 46)],
          ),
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => WhatsappMainPage(),));
              Navigator.pop(context);
            },
            child: Container(
              width: 90,
              height: 90,
              child: Image.network("https://pngimg.com/d/whatsapp_PNG21.png"),
            ),
          ),
        ),
      ),
    );
  }
}
