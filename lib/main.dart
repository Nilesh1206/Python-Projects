// Login

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:airwaycompanion/screens/home_screen.dart';
// import 'package:airwaycompanion/screens/login_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         debugShowCheckedModeBanner: false,
//         home: const InitializerWidget());
//   }
// }

// class InitializerWidget extends StatefulWidget {
//   const InitializerWidget({Key? key}) : super(key: key);

//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }

// class _InitializerWidgetState extends State<InitializerWidget> {

//   // ignore: avoid_init_to_null
//   late FirebaseAuth? _auth;

//   late User? _user;

//   bool isLoading = true;

//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     super.initState();
//     // initState().whenComplete((){
//     //       setState(() {});
//     //    });
//     _auth = FirebaseAuth.instance;
//     // if(_auth?.currentUser!=null)
//     // {
//       _user =  _auth?.currentUser;
//     // }
//     isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading ? Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     ) : _user == null ? LoginScreen() : HomeScreen();
//   }
// }

// Chat Bot

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.chat),
//       ),
//     );
//   }
// }

// Login

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Flutter Fire: Phone Auth'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Future<FirebaseApp> _firebaseApp;
//   TextEditingController _phoneNumber = TextEditingController();
//   TextEditingController _otp = TextEditingController();

//   bool isLoggedIn = false;
//   bool otpSent = false;
//   late String uid;
//   late String _verificationId;

//   void _verifyOTP() async {
//     // we know that _verificationId is not empty
//     final credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId, smsCode: _otp.text);

//     try {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       if (FirebaseAuth.instance.currentUser != null) {
//         setState(() {
//           isLoggedIn = true;
//           uid = FirebaseAuth.instance.currentUser!.uid;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _sendOTP() async {
//     print(_phoneNumber.text);
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: _phoneNumber.text,
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//     setState(() {
//       otpSent = true;
//     });
//   }

//   void codeAutoRetrievalTimeout(String verificationId) {
//     setState(() {
//       _verificationId = verificationId;
//       otpSent = true;
//     });
//   }

//   void codeSent(String verificationId, [int? a]) {
//     setState(() {
//       _verificationId = verificationId;
//       otpSent = true;
//     });
//   }

//   void verificationFailed(FirebaseAuthException exception) {
//     print(exception.message);
//     setState(() {
//       isLoggedIn = false;
//       otpSent = false;
//     });
//   }

//   void verificationCompleted(PhoneAuthCredential credential) async {
//     await FirebaseAuth.instance.signInWithCredential(credential);
//     if (FirebaseAuth.instance.currentUser != null) {
//       setState(() {
//         isLoggedIn = true;
//         uid = FirebaseAuth.instance.currentUser!.uid;
//       });
//     } else {
//       print("Failed to Sign In");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _firebaseApp = Firebase.initializeApp();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: new Center(
//         child: FutureBuilder(
//           future: _firebaseApp,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting)
//               return const CircularProgressIndicator();
//             return isLoggedIn
//                 ? Center(
//                     child: Text('Welcome User!\nYour uid is: $uid'),
//                   )
//                 : otpSent
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextField(
//                             controller: _otp,
//                             decoration: InputDecoration(
//                               hintText: "Enter your OTP",
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: _verifyOTP,
//                             child: Text("Sign In"),
//                           ),
//                         ],
//                       )
//                     : Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           TextField(
//                             controller: _phoneNumber,
//                             decoration: InputDecoration(
//                               hintText: "Enter your phone number",
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                         // ignore: avoid_print
//                           ElevatedButton(
//                             onPressed: _sendOTP,
//                             child: Text("Send OTP"),
//                           ),
//                         ],
//                       );
//           },
//         ),
//       ),
//     );
//   }
// }

// Maps

// import 'package:flutter/material.dart';
// import 'package:airwaycompanion/src/blocs/application_bloc.dart';
// import 'package:airwaycompanion/src/screens/home_screen.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ApplicationBloc(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         home: HomeScreen(),
//       ),
//     );
//   }
// }

// Google Map

// import 'package:flutter/material.dart';
// import 'homepage.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter GoogleMaps Demo',
//       theme: ThemeData(
//         primaryColor: Color(0xff6200ee),
//       ),
//       home: HomePage(),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

// Tickit Booking

// import 'package:airwaycompanion/models/user.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// void main() => runApp(
//   MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   )
// );

// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   // ignore: prefer_final_fields
//   List<User> _users = [
//     User('Elliana Palacios', '@elliana', 'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b', false),
//     User('Kayley Dwyer', '@kayley', 'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3', false),
//     User('Kathleen Mcdonough', '@kathleen', 'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da', false),
//     User('Kathleen Dyer', '@kathleen', 'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387', false),
//     User('Mikayla Marquez', '@mikayla', 'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', false),
//     User('Kiersten Lange', '@kiersten', 'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', false),
//     User('Carys Metz', '@metz', 'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', false),
//     User('Ignacio Schmidt', '@schmidt', 'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', false),
//     User('Clyde Lucas', '@clyde', 'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', false),
//     User('Mikayla Marquez', '@mikayla', 'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ', false)
//   ];

//   List<User> _foundedUsers = [];

//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     super.initState();

//     setState(() {
//       _foundedUsers = _users;
//     });
//   }

//   onSearch(String search) {
//     setState(() {
//       _foundedUsers = _users.where((user) => user.name.toLowerCase().contains(search)).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey.shade900,
//         // ignore: sized_box_for_whitespace
//         title: Container(
//           height: 38,
//           child: TextField(
//             onChanged: (value) => onSearch(value),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey[850],
//               // ignore: prefer_const_constructors
//               contentPadding: EdgeInsets.all(0),
//               prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(50),
//                 borderSide: BorderSide.none
//               ),
//               hintStyle: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey.shade500
//               ),
//               hintText: "Search users"
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         color: Colors.grey.shade900,
//         child: _foundedUsers.length > 0 ? ListView.builder(
//           itemCount: _foundedUsers.length,
//           itemBuilder: (context, index) {
//             return Slidable(
//               actionPane: SlidableDrawerActionPane(),
//               actionExtentRatio: 0.25,
//               child: userComponent(user: _foundedUsers[index]),
//               actions: <Widget>[
//                 // ignore: unnecessary_new
//                 new IconSlideAction(
//                   caption: 'Archive',
//                   color: Colors.transparent,
//                   icon: Icons.archive,

//                   onTap: () => print("archive"),
//                 ),
//                 IconSlideAction(
//                   caption: 'Share',
//                   color: Colors.transparent,
//                   icon: Icons.share,
//                   onTap: () => print('Share'),
//                 ),
//               ],
//               secondaryActions: <Widget>[
//                 IconSlideAction(
//                   caption: 'More',
//                   color: Colors.transparent,
//                   icon: Icons.more_horiz,
//                   onTap: () => print('More'),
//                 ),
//                 IconSlideAction(
//                   caption: 'Delete',
//                   color: Colors.transparent,
//                   icon: Icons.delete,
//                   onTap: () => print('Delete'),
//                 ),
//               ],
//             );
//           }) : Center(child: Text("No users found", style: TextStyle(color: Colors.white),)),
//       ),
//     );
//   }

//   userComponent({required User user}) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       padding: EdgeInsets.only(top: 10, bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               // ignore: sized_box_for_whitespace
//               Container(
//                 width: 60,
//                 height: 60,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: Image.network(user.image),
//                 )
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(user.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
//                   SizedBox(height: 5,),
//                   Text(user.username, style: TextStyle(color: Colors.grey[500])),
//                 ]
//               )
//             ]
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 user.isFollowedByMe = !user.isFollowedByMe;
//               });
//             },
//             child: AnimatedContainer(
//               height: 35,
//               width: 110,
//               duration: Duration(milliseconds: 300),
//               decoration: BoxDecoration(
//                 color: user.isFollowedByMe ? Colors.blue[700] : Color(0xffffff),
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: user.isFollowedByMe ? Colors.transparent : Colors.grey.shade700,)
//               ),
//               child: Center(
//                 child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow', style: TextStyle(color: user.isFollowedByMe ? Colors.white : Colors.white))
//               )
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart';

// Main Function Start
void main() {
  runApp(MyApp());
}
// Main Function Ends

// First Stateless Widget with MaterialApp Start
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      home: ListViewPage(),
    );
  }
}
// First Stateless Widget with MaterialApp Ends

// Main Stateful Widget Start
class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  // Title List Here
  var titleList = [
    "Mumbai to Delhi",
    "Delhi to Mumbai",
    "Chennai to Bangalore",
    "Bangalore to Chennai",
    "Kolkata to Hyderabad",
    "Hyderabad to Kolkata",
    "Jaipur to Mumbai"
  ];

  // Description List Here
  var ic = Icon(Icons.calendar_today);
  var descList = [
    "Date:                  Day: \nArrival:              Departure:",
    "Date:                  Day: \nArrival:              Departure:",
    "Date:                  Day: \nArrival:              Departure:",
    "Date:                  Day: \nArrival:              Departure:",
    "Date:                  Day: \nArrival:              Departure:",
    "Date:                  Day: \nArrival:              Departure:",
    "Date:                  Day: \nArrival:              Departure: "
  ];

  // Image Name List Here
  var imgList = [
    "assets/images/plane1.jpg",
    "assets/images/plane1.jpg",
    "assets/images/plane1.jpg",
    "assets/images/plane1.jpg",
    "assets/images/plane1.jpg",
    "assets/images/plane1.jpg",
    "assets/images/plane1.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
          "Flight Details",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      // Main List View With Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, imgList[index], titleList[index], descList[index]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  String source = "IN";
  String full1 = "INDIA";
  String dest = "DXB";
  String full2 = "DUBAI";
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 400,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  // child: Image.asset(
                  //   img,
                  //   width: 200,
                  //   height: 200,
                  // ),
                  child: Column(
                    children: [
                      Container(
                        // height: 80,
                        width: 330,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "FLIGHT                    OPERATED BY                   AIRCRAFT              BOOKING NUMBER",
                          style: TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                      ),

                      // SizedBox(height: 10,),
                      Container(
                        width: 330,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "BLUE-\n EXPRESS           BIALAIRWAY                 AIRBUS 344                 FBX425",
                          style:
                              TextStyle(fontSize: 10, color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text(
                //   title,
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),


                // Till
                Container(
                  child: Row(
                    children: [
                      Container(
                          // height: 100,
                          // width: 300,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          // ignore: unnecessary_string_interpolations
                          child: Column(
                            children: [
                              Text(
                                // ignore: unnecessary_string_interpolations
                                "$source",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.blueAccent),
                              ),
                              // SizedBox(height: 5),
                              Text(
                                // ignore: unnecessary_string_interpolations
                                "$full1",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.blueAccent),
                              ),
                            ],
                          )),
                      Container(
                          // height: 100,
                          // width: 300,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          // ignore: unnecessary_string_interpolations
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                // ignore: unnecessary_string_interpolations
                                " -------- ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueAccent),
                              ),
                              Icon(
                                Icons.flight_sharp,
                                color: Colors.blueAccent,
                                size: 50,
                              ),
                              // Icon()
                              Text(
                                // ignore: unnecessary_string_interpolations
                                " -------- ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueAccent),
                              ),
                            ],
                          )),
                      Container(
                          // height: 100,
                          // width: 300,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          // ignore: unnecessary_string_interpolations
                          child: Column(
                            children: [
                              Text(
                                // ignore: unnecessary_string_interpolations
                                "$dest",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.blueAccent),
                              ),

                              Text(
                                // ignore: unnecessary_string_interpolations
                                "$full2",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.blueAccent),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // Container(
                      //   // height: 200,
                      //   // width: 100,
                      //   alignment: Alignment.topLeft,
                      //   child: Icon(Icons.dark_mode,color: Colors.blueAccent, size: 50,),
                      // )
                      Icon(Icons.dark_mode,color: Colors.blueAccent, size: 50,),
                      SizedBox(width: 190,),
                      Icon(Icons.light_mode,color: Colors.blueAccent, size: 50,),
                    ],
                  ),
                ),

                Container(
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        child: Text("Sun 22 2021", style: TextStyle(color: Colors.blueAccent),),
                      ),
                      SizedBox(width: 150,),
                      Container(
                        child: Text("Mon 23 2021", style: TextStyle(color: Colors.blueAccent),),
                      ),
                    ],
                  ),
                ),



                Container(
                  child: Row(
                    children: [
                      Container(
                          // height: 100,
                          // width: 300,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          // ignore: unnecessary_string_interpolations
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                // ignore: unnecessary_string_interpolations
                                "22:05",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueAccent),
                              ),
                              // SizedBox(height: 5),
                              Text(
                                // ignore: unnecessary_string_interpolations
                                "BIARAIRWAY",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.blueAccent),
                              ),
                            ],
                          )),
                      Container(
                          // height: 100,
                          // width: 300,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          // ignore: unnecessary_string_interpolations
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                // ignore: unnecessary_string_interpolations
                                " ----- ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueAccent),
                              ),
                              Text(
                                // ignore: unnecessary_string_interpolations
                                "15h 40m \n NON STOP",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    // fontSize: 20,
                                    color: Colors.blueAccent),
                              ),
                              // Icon()
                              Text(
                                // ignore: unnecessary_string_interpolations
                                " ----- ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueAccent),
                              ),
                            ],
                          )),
                      Container(
                          // height: 100,
                          // width: 300,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          // ignore: unnecessary_string_interpolations
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                // ignore: unnecessary_string_interpolations
                                "08:25",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blueAccent),
                              ),

                              Text(
                                // ignore: unnecessary_string_interpolations
                                "DUBAI AIRPORT",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.blueAccent),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),


                SizedBox(height: 30,),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  color: Colors.blueAccent,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text("PASSENGER        SEAT         DEPARTURE     BORDING ZONE      GATE", style: TextStyle(color: Colors.white, fontSize: 10),),
                            SizedBox(height: 5,),
                            Text("HARRY     334C    22:05 PM         D3        A33", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),

                      // SizedBox(width:10),

                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
