import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const SignupPage());
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

/*class _SignupPageState extends State<SignupPage> {
  String dropdownValue = 'Passenger';
  String username = '';
  String password = '';
  String phoneNumber = '';*/

class _SignupPageState extends State<SignupPage> {
  String dropdownValue = 'Passenger';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _signup() async {
    final response = await http.post(
      Uri.parse("localhost"),
      body: {
        'username': _nameController.text,
        'password': _passwordController.text,
        'phoneNumber': _phoneController.text,
        'role': dropdownValue,
      },
    );

    if (response.statusCode == 200) {
      // handle success
    } else {
      // handle error
    }
  }

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
          title: Text('Sign Up Screen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign up',
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
                            labelText: 'Username',
                            hintText: 'Enter username',
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {
                            /*setState(() {
                              username = value;
                            });*/

                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter email' : null;
                          },
                        ),
                      ),

                      SizedBox(height: 30,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter Password',
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {

                            /*setState(() {
                              password = value;
                            });*/

                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter password' : null;
                          },
                        ),
                      ),

                      SizedBox(height: 30,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintText: 'Enter phone number',
                            prefixIcon: Icon(Icons.numbers),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {

                            /*setState(() {
                              phoneNumber = value;
                            });*/

                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter email' : null;
                          },
                        ),
                      ),

                      SizedBox(height: 5,),


                                DropdownButton<String>(
                                  value: dropdownValue,
                                  items: <String>['Passenger','Driver']
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
                          child: Text('Sign up'),
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
