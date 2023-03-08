import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sdgpapp/signroute.dart';

// main method
void main() {runApp(const MaterialApp(home: MyApp() ,));} 



// login screen
class MyApp extends StatelessWidget {
  const MyApp();
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
          child: const TextField(
            decoration: InputDecoration(
              labelText: "Username/Phone number"
            ),
          ),
          ),

// Password
            Container(
          alignment: Alignment.center,
          child: const TextField(
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
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>    SignRoutee()),
  );},
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
             

              ],
              ),
             
            
                      )
                    ],
        ),
      ),
    // )
  );
    // );
  }

// for logging press
void logpress(){



}

// for sign press
void signpress(context){

        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>    SignRoutee()),
  );
  
}


