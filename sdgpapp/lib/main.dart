import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sdgpapp/LoggedIN.dart';
import 'package:sdgpapp/loggedroute.dart';
import 'package:sdgpapp/LoggedIN.dart';
import 'package:sdgpapp/signroute.dart';


 TextEditingController _textEditingControllerPw = TextEditingController();

 TextEditingController _textEditingControllerName = TextEditingController();
// main method
void main() {runApp( MaterialApp(home: MyApp() ,));} 



// login screen
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

@override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
String name1='';
String pw1='';

  bool _stayloggedinbut=false;
    //  MyApp();
  @override


  Widget build(BuildContext context)=>Scaffold( 
    
    // TODO: implement build
    // return MaterialApp(
      
    //   home: Scaffold(
    appBar: AppBar(
          title:Text("main screen ")
          ),
        
        body: Center(
          
         child:Column(

// centering the input fields
// alliging the child
          mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
// username

            Container(
          alignment: Alignment.center,


          child:  TextField(
              controller: _textEditingControllerName,

            decoration: InputDecoration(
              labelText: "Username/Phone number"
            ),
          ),

          ),

// Password
            Container(
          alignment: Alignment.center,
          child:  TextField(

              controller: _textEditingControllerPw,

            decoration: InputDecoration(
              labelText: "Password"
            ),
          ),
          ),
// button
          Container(

            padding: EdgeInsets.all(16.0),
            
            child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              
              
              
              
              children: [
                
// login button

                TextButton(

              onPressed: () { 
                name1=_textEditingControllerName.text; 
                pw1=_textEditingControllerPw.text;
getRequest(context,name1,pw1);
                // getRequest(context,name1,pw1);
                },
              style: TextButton.styleFrom(

                primary: Colors.blue, // Text Color
            shape: RoundedRectangleBorder(side: BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid

            
          ), borderRadius: BorderRadius.circular(50)),
  
              ),
              child: const Text(
                'Login ',
                style: TextStyle(fontSize: 24),
              ),
              
            ),

// padding manully
SizedBox(
      width: 20, //<-- SEE HERE
    ),

// ssignup button
   TextButton(
              onPressed: () {signpress(context);},
              style: TextButton.styleFrom(

                primary: Colors.blue, // Text Color
             shape: RoundedRectangleBorder(side: BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid
            
          ), borderRadius: BorderRadius.circular(50)),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 24),
              ),
            )

// todo
//            Row( 
//   children: [
//     Checkbox(
//       value: _stayloggedinbut,
//       onChanged: (value) {
//         setState(() {
//           _stayloggedinbut = value!;
//         });
//       },
//     ),
//     Text('Stay Logged In'),
//   ],
// ),
             

              ],
              ),
             
            
                      )
                    ],
        ),
      ),
    // )
  );
                    // String pw1 = _textEditingControllerPw.text;


    // );
  }
// rem




// method for login button press
void getRequest(context,name1,pw1) async {
  print(name1);
  String urlmain = "http://localhost:3000/login";
  urlmain=urlmain+"?name="+name1+"&password="+pw1;

// String urlmain="http://localhost:5000/log";
  var url = Uri.parse(urlmain);
  // var response = await http.get(url);
    final response = await http.get(Uri.parse(urlmain));

  final responseData = response.body;


   showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Data'),
          content: Text(responseData),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  

    if (responseData=="Erorr"){
      // cleaning the textfield if error happens
        _textEditingControllerName.clear();
        _textEditingControllerPw.clear();
    }
    if (responseData=="Logged IN"){
        logpress(context,name1);
    }
    if (responseData=="Invalid Inputs"){
       // cleaning the textfield if error happens
        _textEditingControllerName.clear();
        _textEditingControllerPw.clear();
    }
    print(responseData);


  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');
}


// for logging press
void logpress(context,name1){



                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>    LoggedIN(name1)),
  );

}

// for sign press
void signpress(context){

        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>    SignRoutee()),
  );
  
}


