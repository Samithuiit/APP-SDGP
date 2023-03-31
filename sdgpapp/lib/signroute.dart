
import 'package:flutter/material.dart';
import 'package:sdgpapp/signroute.dart';

// main method


// login screen
class SignRoutee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return MaterialApp(
      
      home: Scaffold(appBar: AppBar(
          title:Text("sssss ")
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
              labelText: "hone number"
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
                  
              onPressed: () {logpress();},
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
              onPressed: () {
  //               Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) =>   const SignRoutee(),
  //     ),
  // );
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
    )
    );
  }

// for logging press
void logpress(){
 
}

// for sign press
void signpress(){
  
}
}

