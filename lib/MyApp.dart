import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text("My App Bar"),
        backgroundColor: Colors.purple[400],
      ),
      body: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final TextEditingController controller = TextEditingController();
  var _name;
  var name = "Whats Your Name?";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(70),
                  child: Center(
                    child: Text(
                      "$name",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What Do People Call You?",
                      labelText: "Name",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    enabled: true,
                    onChanged: (value) => _name = value,
                    controller: controller,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: FlatButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        name = "Hi! $_name";
                      });
                    },
                    padding: const EdgeInsets.fromLTRB(45, 15, 45, 15),
                    autofocus: true,
                    color: Colors.red[400],
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
