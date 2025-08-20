import 'package:auth_flow/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences simlpeStorgae;
void main(List<String> args)async {

  WidgetsFlutterBinding.ensureInitialized();

  simlpeStorgae =await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:simlpeStorgae.getString("token")==null? LogInPage():HomePage());
  }
}

// String name= "";
// String phone = "";
class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              // maxLines: 3
              // obscureText: true,
              decoration: InputDecoration(
                // enabled: false,
                // fillColor: Colors.red,
                // filled: true,
                // helperText:"Hello World" ,
                // labelText:"Hello World" ,
                // hintText: "Hello World",
                // prefixText: "+963",
                // suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (value == "") {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("data")));
                }
              },
            ),
            Padding(padding: EdgeInsetsGeometry.all(20)),
            TextField(
              controller: password,
              decoration: InputDecoration(border: OutlineInputBorder()),
              // onChanged: (value) {
              //   name=value;
              //   print(value);
              // },
            ),
            InkWell(
              onTap: () async {
                bool status = await service.login(
                  name.text,
                  password.text,
                );
                if (status) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("PLease retry"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                child: Text("Login", style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 160,
                height: 54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AuthService service =AuthService();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),
      actions: [IconButton(onPressed: (){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage(),));
simlpeStorgae.clear();
      }, icon: Icon(Icons.logout))],
      ),
      body: FutureBuilder(
        future: service.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(snapshot.data!.image),
                ListTile(
                  title: Text(snapshot.data!.email),
                  subtitle: Text(snapshot.data!.lastName),
                ),
              ],
            );
          } else {
            return Center(child: LinearProgressIndicator());
          }
        },
      ),
    );
  }
}
