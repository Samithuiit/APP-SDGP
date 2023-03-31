
import 'package:flutter/material.dart';

// next page after loging in (main menu)
class LoggedIN extends StatelessWidget {

// user name
final String name1;
  LoggedIN(this.name1);


  @override
  Widget build(BuildContext context)=>Scaffold( 

// app bar
appBar: AppBar(
          title:Text("SDGP")
          ),
        

// centring
     body: Center(
// columns        
         child:Column(


// centering the input fields
// alliging the child
          mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
// container for balance
            Container(

              // outline
                margin: const EdgeInsets.all(60.0),
              padding: const EdgeInsets.all(3.0),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black)

  ),
          alignment: Alignment.center,
// columns for the balance details          
      child:Column(
          
// centering
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,

// children for balance   details
              children: [
                Text("Balance"),

// manual paddings
                    SizedBox(
                  height: 15, //<-- SEE HERE
                ),


// row to allign 2 items in one row
                 Row(
// centring
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
// two items as childrne                  
                  children:[
                   Text("100lkr"),

// manual paddings
                    SizedBox(
                  width: 70, //<-- SEE HERE
                ),
// coin picture
                Text("Picture")
                              ]
                )
                    
  //  children end
              ]
              
              )

            ), 
            Container(
              child: Column(
                children:[
 TextButton(
              onPressed: () {
                print('Button 1 pressed');
              },
              child: Text('Scan QR'),
            ),
            SizedBox(height: 20),    ]          )
            )
          ]
            )
                 
            )
         
          
                   );
         




  
}