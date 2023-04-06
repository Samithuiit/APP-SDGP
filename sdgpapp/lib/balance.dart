import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const Balance());
}

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  String dropdownValue = 'Recharge';

  /*@override
  void initState() {
    super.initState();
    _initDatabase(); // connect to the database when the app starts
  }

  Future<void> _initDatabase() async {
    // open the database connection
    _database = await openDatabase(
      'my_database.db',
      version: 1,
      onCreate: (db, version) async {
        // create the database table
        await db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, role TEXT)',
        );
        // insert some data into the table
        await db.rawInsert(
          'INSERT INTO users (name, role) VALUES (?, ?)',
          ['John Doe', 'Passenger'],
        );
        await db.rawInsert(
          'INSERT INTO users (name, role) VALUES (?, ?)',
          ['Jane Doe', 'Driver'],
        );
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Balance Screen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Balance',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Form(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            hintText: 'Enter amount',
                            prefixIcon: Icon(Icons.money),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {

                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter amount' : null;
                          },
                        ),
                      ),

                      SizedBox(height: 30,),

                      SizedBox(height: 5,),

                      // Step 1.
                      // Step 2.
                      DropdownButton<String>(
                        // Step 3.
                        value: dropdownValue,
                        // Step 4.
                        items: <String>['Recharge','Pay']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 30),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: Text('Done'),
                          color: Colors.blue,
                          textColor: Colors.white,

                        ),
                      ),

                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
