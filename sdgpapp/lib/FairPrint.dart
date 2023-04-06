
import 'package:flutter/material.dart';
import 'package:sdgpapp/signroute.dart';

// main method


// login screen
class FairPrint extends StatelessWidget {
  final String type;
  final String phonenum;
  final String fair;
  final String result;
  final String busdetail2;


  FairPrint(this.type, this.phonenum,this.fair,this.result,this.busdetail2);

  
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return MaterialApp(
      
      home: Scaffold(appBar: AppBar(
          title:Text("Payment ")
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
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  child: Text(
    'Fair is: $fair LKR',
    style: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
),

// Distance Travelled
Container(
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  child: Text(
    'Distance Travelled: $result KM',
    style: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
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
                  
              onPressed: () {},
              style: TextButton.styleFrom(

                primary: Colors.blue, // Text Color
            shape: RoundedRectangleBorder(side: BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid

            
          ), borderRadius: BorderRadius.circular(50)),
  
              ),
              child: const Text(
                'Pay ',
                style: TextStyle(fontSize: 24),
              ),
              
            ),

// ssignup button

             

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

