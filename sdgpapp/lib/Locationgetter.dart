import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as Math;
import 'package:sdgpapp/LoggedIN.dart';




// location imports
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sdgpapp/FairPrint.dart';


// global class
class Global {
  static final Global _singleton = Global._internal();

  String idnumber = "0";
  String phonenumberr="0";
  String typee="0";
  String busdetail="0";
  factory Global() {
    return _singleton;
  }

  Global._internal();

  void setIdNumber(String newIdNumber) {
    idnumber = newIdNumber;
  }
  void setphoneNumber(String newphonenumberr) {
    phonenumberr = newphonenumberr;
  }
  void settypeNumber(String typenew) {
    typee = typenew;
  }
  void setbusdetail(String newbusdetails){
    busdetail=newbusdetails;
  }

  

}



LocationData? currentLocation;

class Locationgetter extends StatefulWidget {
  final String type;
  final String phonenum;
  // final String busdetailnumb;

  Locationgetter(this.type, this.phonenum);

    

  @override
  _LocationState createState() => _LocationState(type,phonenum);


}

class _LocationState extends State<Locationgetter> {
        
 final String type;
  final String phonenum;
  // final String busdetailnumber;

  _LocationState(this.type, this.phonenum);
  


  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Location'),
      ),
      body: Center(
        child: ElevatedButton(
      onPressed: () {
        print("object");
        getLocation(context,phonenum,type);
      },
      child: Text('Scan successful:Please press to continue'),
    ),
      ),
       
      
    );
  }




}

void locationeneable()async{
  
bool isLocationEnabled = await Location().serviceEnabled();

// Request location permission 
PermissionStatus permissionStatus = await Location().requestPermission();
if (permissionStatus != PermissionStatus.granted) {
  
  return;
}

// Check if GPS is turned on
if (!isLocationEnabled) {
  bool serviceStatusResult = await Location().requestService();
  if (!serviceStatusResult) {
    return;
  }
}
}

// getting the current location 
void getLocation(context,phonenumb,type) async {



// pop up showDialog(
    


  Global global2=Global();
  global2.setphoneNumber(phonenumb);
  global2.settypeNumber(type);
    print("check "+global2.phonenumberr+" "+global2.typee);


  var location = Location();
  try {
    currentLocation = await location.getLocation();
    print("Current location getted");
    getLatLngFromLocationData(currentLocation!,context,phonenumb);
  } catch (e) {
    print('Error: $e');
  }
}

// converting it to lat lang
LatLng getLatLngFromLocationData(LocationData locationData,BuildContext context,phonenumb) {
  
  print(locationData.latitude!);
   
print(locationData.longitude);
var lat=locationData.latitude;
var long=locationData.longitude;


// post method call
Global global=Global();
print(global.idnumber+" idnumber");
if (global.idnumber=="0"){
sendLocationData(phonenumb,lat.toString(),long.toString(),context);
}
else{sendLocationData2(phonenumb,lat.toString(),long.toString(),context);
}



  return LatLng(locationData.latitude!, locationData.longitude!);
}


Future<Map<String, dynamic>> sendLocationData( String phoneNumber,  String latitude,String  longitude,context) async {
    print("object11111");
    print("location set data "+phoneNumber+" "+latitude+" "+longitude);

  final String apiUrl = 'http://localhost:3000/location';
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'phoneNumber': phoneNumber, 'latitude': latitude, 'longitude': longitude,}),
  );


  if (response.statusCode == 200) {
      Global global=Global();
    print("im here111");
    
    final jsonResponse = json.decode(response.body);
    final resultInsertIdProperty = jsonResponse['insertId'];
    global.setIdNumber(resultInsertIdProperty.toString());
    print(global.idnumber+" idnumber check");
final typefin=global.typee.toString();
  logpress(context,typefin,phoneNumber);

    
    print('Inserted ID:');
        print('Inserted ID:$resultInsertIdProperty');

  return jsonDecode(response.body); 
  } else {
    throw Exception('Failed to send location data');
  }
}

Future<Map<String, dynamic>> sendLocationData2( String phoneNumber,  String latitude,String  longitude,context) async {
  Global global=Global();
    print(phoneNumber+" "+latitude+" "+longitude);
  
  final String apiUrl = 'http://localhost:3000/location2';
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'phoneNumber': phoneNumber, 'latitude': latitude, 'longitude': longitude,'count':global.idnumber}),
  );


  if (response.statusCode == 200) {
    getterforlatlong(context);
    // calculate fee
  return jsonDecode(response.body); 
  } else {
    throw Exception('Failed to send location data');
  }
}
Future<void> getterforlatlong(context) async {
  print("1");
  Global global=Global();
  final id =global.idnumber;
print("2");
  final response = await http.get(Uri.parse('http://localhost:3000/getlocationdata/$id'));
print("3");
  if (response.statusCode == 200) {
    print("4");
  // server output/to json
    final data = json.decode(response.body);
    print("5");
    // Assign  fields to variables
    final start_latitude = data['data']['start_latitude'];
    final start_longitude = data['data']['start_longitude'];
    final end_latitude = data['data']['end_latitude'];
    final end_longitude = data['data']['end_longitude'];
print("6");
  print("start "+start_longitude.toString()+start_latitude.toString()+" end "+end_longitude.toString()+end_latitude.toString());
print("7");
 distance(6.9271, 79.8612, 6.7106, 79.9074,context);
// final double distanceInKm = distance(start_latitude, start_longitude,end_latitude, end_longitude,context);


  } else {
    throw Exception('Failed to load data');
  }
}
//  Haversine formula
 distance(double lat1, double lon1, double lat2, double lon2,context) {
  const p = 0.017453292519943295;
  final a = 0.5 -
      Math.cos((lat2 - lat1) * p) / 2 +
      Math.cos(lat1 * p) *
          Math.cos(lat2 * p) *
          (1 - Math.cos((lon2 - lon1) * p)) /
          2;
  double result = 12742 * Math.asin(Math.sqrt(a));
  print(result.toString());

  double fair=result*2*7.5;
  print("proce "+fair.toString());

 
  Global global2=Global();
  // changed idnu=type
  final idnu=global2.idnumber;
  final phonenum=global2.phonenumberr;
    final bus=global2.busdetail;
    getreqfordsitance(result.toString(),fair.toString(),context);

                Navigator.push(
    context,
    // changed idnu=type
    MaterialPageRoute(builder: (context) =>    FairPrint(idnu,phonenum,fair.toStringAsFixed(2),result.toStringAsFixed(2),bus.toString())),
  );

 }
 Future<void> getreqfordsitance(result,fair,context) async {
  Global global=Global();
  String urlmain = "http://localhost:3000/setFin";
  urlmain=urlmain+"?result="+result+"&fair="+fair+"&id="+global.idnumber.toString();
  final response = await http.get(Uri.parse(urlmain));
  print(response.body);
  final typefin=global.typee.toString();
  final phonenumb=global.phonenumberr.toString();
  return;
}
void logpress(context,type,phonenum){



                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>    LoggedIN(type,phonenum)),
  );

}
