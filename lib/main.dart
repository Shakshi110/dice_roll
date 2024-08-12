import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math'; //for random number generater.

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey
  ));
  runApp(MyDiceApp());
}

//this part for create an app
class MyDiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //capetino for ios
      debugShowCheckedModeBanner: false,
      title: 'StatefulWidget Work',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey,
            systemNavigationBarColor: Colors.grey
          )
        ),
        // This is the theme of your application.
          primarySwatch: Colors.indigo),

      home: MyHomePage(),
    );
  }
}

//first page of app
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //initialize the dice to one
  int leftDiceNumber= 1;
  int rightDiceNumber= 1;
  String result= "";
  //to roll the dice on tap to shuffle button and to check winner
  void change(){
    setState(() {
      rightDiceNumber= Random().nextInt(6)+1;
      leftDiceNumber= Random().nextInt(6)+1;
      //check which player is won
      if(rightDiceNumber>leftDiceNumber){
        result= "Player 2 is Winner";
      }else if(leftDiceNumber>rightDiceNumber){
        result= "Player 1 is Winner";
      }else{
        result= "It's a Tie";
      }
    });
  }
  //to reset the dice by tapping replay icon button
  void reset(){
    setState(() {
      leftDiceNumber=1;
      rightDiceNumber=1;
      result= "" ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // scaffold class is for material class
        appBar: AppBar(
        backgroundColor: Color(0xFFC94F4F),
        title: Center(
        child: Text("Dice Game",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
    )),
    ),
  body:  Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text("Player 1 vs Player 2",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w400),),
  // Container(height: 300,),
  SizedBox(height: 20,),
  Text(result,style: TextStyle(fontSize:15 ),),
  SizedBox(height: 10,),
  Column(
  children: [],
  ),
  Row(
  children: [
  Expanded(
  child: TextButton(
  child: Image(image: AssetImage('assets/dice-png-$leftDiceNumber.png')),
  onPressed: (){
  // setState(() {
  //   leftDiceNumber= Random().nextInt(6)+1;//take a range 0-5 so add 1 for ranging 1-6
  // //  rightDiceNumber= Random().nextInt(6)+1; //to change both dices on clicking any one
  // });
  },
  ),
  ),
  Expanded(
  child: TextButton(
  child: Image(image: AssetImage('assets/dice-png-$rightDiceNumber.png')),
  onPressed: (){},
  ),
  )
  ]
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: [
  Text("PLAYER 1"),
  Text("PLAYER 2")
  ],
  ),
  SizedBox(height: 10,),
  ElevatedButton(
  style: ButtonStyle(),
  child: Text("Throw",style: TextStyle(color: Colors.red.shade700,fontSize: 23),),
  onPressed: (){change();}
  ),
  IconButton(
  icon:Icon(Icons.replay,size: 30,),
  onPressed: (){reset();},
  )
  ],
  ),
  );
}
}
// theme: ThemeData.dark().copyWith(
// primaryColor: Color(0xFF0A0E21),
// scaffoldBackgroundColor: Color(0xFF0A0E21),
// appBarTheme: AppBarTheme(
// color: Color(0xFF0A0E21),
// //for status bar
// systemOverlayStyle: SystemUiOverlayStyle(
// statusBarColor: Colors.grey,
// systemNavigationBarColor: Color(0xFF0A0E21)
// )
// ),