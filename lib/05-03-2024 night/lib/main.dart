import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local/my_app.dart';
import 'package:local/utils/app_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FireBaseNotification().setUpLocalNotification();
  // FirebaseAnalyticsUtils().init();
  // FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  // runZonedGuarded<Future<void>>(() async {
  // await crashlytics.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = crashlytics.recordFlutterError;
  await AppPreference.initMySharedPreferences();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
  // }, (error, stack) => print(error));
  // crashlytics.recordError(error, stack));
}



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:local/utils/assets.dart';
//
// import 'utils/app_colors.dart';
// import 'widget/common_text.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class Restaurant {
//   final String name;
//   final String location;
//   final double distance;
//   final double rating;
//   final String closingTime;
//
//   Restaurant({
//     required this.name,
//     required this.location,
//     required this.distance,
//     required this.rating,
//     required this.closingTime,
//   });
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Restaurant List'),
//         ),
//         body: RestaurantList(),
//       ),
//     );
//   }
// }
//
// class RestaurantList extends StatelessWidget {
//   final List<Restaurant> restaurants = [
//     Restaurant(
//       name: 'Restaurant A',
//       location: '123 Main St',
//       distance: 2.5,
//       rating: 4.5,
//       closingTime: '10:00 PM',
//     ),
//     Restaurant(
//       name: 'Restaurant B',
//       location: '456 Elm St',
//       distance: 3.2,
//       rating: 4.0,
//       closingTime: '9:30 PM',
//     ),
//     // Add more restaurants here
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: restaurants.length,
//         itemBuilder: (context, index) {
//           return Container(height: 156, child: RestaurantCard(restaurant: restaurants[index]));
//         },
//       ),
//     );
//   }
// }
//
// class RestaurantCard extends StatelessWidget {
//   final Restaurant restaurant;
//
//   const RestaurantCard({required this.restaurant});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 226,
//       width: 158,
//       child: Card(
//         shadowColor: Colors.red,
//         elevation: 5.0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         // color: productDisplayContoller.isSelected(index) ? const Color(0xFF151026) : Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)), // Image border
//               child: Image.asset(
//                 ImagesAsset.homeImage,
//                 width: double.infinity,
//                 scale: 1,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Stack(children: [
//               Column(
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: Text("${restaurant.location}" ?? '',
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             ImagesAsset.searchW,
//                             fit: BoxFit.cover,
//                             scale: 4,
//                             color: AppColors.whiteColor,
//                           ),
//                           Text('${restaurant.distance} KM',
//                               style: TextStyle(
//                                 fontSize: 12,
//                               )),
//                         ],
//                       ),
//                       Text("⭐ ${restaurant.rating}" ?? "", style: TextStyle(fontSize: 12)),
//                     ],
//                   ),
//
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 15),
//                         child: Image.asset(
//                           ImagesAsset.searchW,
//                           fit: BoxFit.cover,
//                           scale: 4,
//                           color: AppColors.whiteColor,
//                         ),
//                       ),
//                       Text('Closes until \n5:00 PM tomorrow' ?? '', style: TextStyle(fontSize: 12)),
//                     ],
//                   ),
//
//                   ///------------------------------ Rating Star Function-------------------------------
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget buildStarRating(double value) {
//   int wholeStars = value.floor();
//   print("wholeStars---$wholeStars");
//   double fractionalStar = value - wholeStars;
//   print("fractionalStar---$fractionalStar");
//
//   List<Widget> starWidgets = List.generate(wholeStars, (index) {
//     return const Icon(Icons.star, color: Colors.amber);
//   });
//
//   if (fractionalStar > 0) {
//     starWidgets.add(
//       const Icon(Icons.star_half, color: Colors.amber),
//     );
//   }
//
//   starWidgets.addAll(
//     List.generate(5 - starWidgets.length, (index) {
//       return const Icon(Icons.star_border, color: Colors.amber);
//     }),
//   );
//
//   return Row(
//     mainAxisSize: MainAxisSize.min,
//     children: starWidgets,
//   );
// }

///------
// import 'package:flutter/material.dart';
//
// import 'utils/assets.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         // backgroundColor: Colors.transparent,
//         body: Column(
//           children: [
//             Expanded(
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image.asset(
//                     ImagesAsset.homeImage,
//                     width: double.infinity,
//                     height: 50,
//                     fit: BoxFit.fill,
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     top: MediaQuery.of(context).size.height / 2,
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.7), // Adjust opacity as needed
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Row(
//                             children: [
//                               Icon(Icons.search),
//                               SizedBox(width: 10),
//                               Expanded(
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Search...',
//                                     border: InputBorder.none,
//                                   ),
//                                   onChanged: (value) {
//                                     // Perform search logic here
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: PermissionHandlerPage(),
//     );
//   }
// }
//
// class PermissionHandlerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: _requestLocationPermission(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return snapshot.data == true ? HomePage() : PermissionDeniedPage();
//         } else {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
//
//   Future<bool> _requestLocationPermission() async {
//     final permissionStatus = await Permission.location.request();
//     return permissionStatus == PermissionStatus.granted;
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late Position _currentPosition;
//   String _currentAddress = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (_currentAddress.isNotEmpty) Text(_currentAddress),
//             ElevatedButton(
//               child: Text("Get location"),
//               onPressed: () {
//                 _getCurrentLocation();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _getCurrentLocation() {
//     Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true).then((Position position) {
//       setState(() {
//         _currentPosition = position;
//         _getAddressFromLatLng();
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }
//
//   _getAddressFromLatLng() async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);
//
//       Placemark place = placemarks[0];
//
//       setState(() {
//         _currentAddress = "${place.name},${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.postalCode}, ${place.country}";
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
// }
//
// class PermissionDeniedPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location Permission Denied"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Location permission is required to access the device's location.",
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 openAppSettings();
//               },
//               child: Text("Open Settings"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
