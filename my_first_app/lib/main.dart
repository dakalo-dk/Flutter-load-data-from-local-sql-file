import "package:flutter/material.dart";
import 'package:my_first_app/model.dart';
import 'package:my_first_app/mydatabase.dart';
//https://www.youtube.com/watch?v=x0uinJvhNxI

List myFruits;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var db = DBProvider.instance;
  myFruits = await db.queryAll();
  for (int i=0; i<myFruits.length;i++){
    Fruits fruit = Fruits.map(myFruits[i]);
    print(fruit);
    print("Name: ${fruit.fruitName} - Shop: ${fruit.shopName} - Price: ${fruit.price}");
  }

  runApp(MyApp());}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

    var _questionIndex = 0;

    void _answerQuestion(){
      setState(() {
        _questionIndex = _questionIndex + 1;
        print(_questionIndex);
        print("Answer Button Pressed!");
      });
    }
  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("My Fruit List"), backgroundColor: Colors.greenAccent,),
      body: ListView.builder(
        itemCount: myFruits.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              leading: Icon(Icons.shopping_basket, color: Colors.white, size: 30),
              title: Text("${Fruits.fromMap(myFruits[index]).fruitName}"),
              subtitle: Text("${Fruits.fromMap(myFruits[index]).shopName} - R ${Fruits.fromMap(myFruits[index]).price}"),
            ),
          color: Colors.blueAccent,
          elevation: 3.0,
          );
        })
/*        Center(
        child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Query',style: TextStyle(color: Colors.red, fontSize: 20),), color: Colors.blue,
              onPressed: () async {
                  //List<Map> queryRows = await DBProvider.instance.queryAll();
                  //queryRows.forEach((element) {print(element["price"]);});

                //print(queryRows[1]);
              },
            ),
          ),

      ])) */   

      ),);
  }

}



