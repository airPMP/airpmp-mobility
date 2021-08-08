// import 'package:flutter/material.dart';
// import 'package:job_card/utilities/widgets.dart';

// class ResourcePage extends StatefulWidget {
//   @override
//   _ResourcePageState createState() => _ResourcePageState();
// }

// class _ResourcePageState extends State<ResourcePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text("Actual Employees", style: TextStyle(fontSize: 19)),
//         centerTitle: true,
//       ),
//       body: ListView.separated(
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//             height: 70,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("Ali Riyami", style: TextStyle(fontSize: 19)),
//                     SizedBox(height: 3),
//                     Text("Liasion Engineer",
//                         style: TextStyle(fontSize: 14, color: Colors.black45)),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Text("2", style: TextStyle(fontSize: 18)),
//                     SizedBox(width: 10),
//                     IconButton(icon: Icon(Icons.edit), onPressed: () {}),
//                     IconButton(icon: Icon(Icons.delete), onPressed: () {}),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return Divider();
//         },
//         itemCount: 100,
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 50),
//         child: button("Add Employee", () {
//           Navigator.of(context).pushNamed("/resource_entering_page");
//         }),
//       ),
//     );
//   }
// }

// class ResourceEnteringPage extends StatefulWidget {
//   @override
//   _ResourceEnteringPageState createState() => _ResourceEnteringPageState();
// }

// class _ResourceEnteringPageState extends State<ResourceEnteringPage> {
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text("Add Employees", style: TextStyle(fontSize: 19)),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(height: 10),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Employee ID / Name",
//                       style: TextStyle(fontSize: 14, color: Colors.black45),
//                     ),
//                     SizedBox(height: 5),
//                     Container(
//                       // height: 80,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.black45, width: 1),
//                         color: Colors.white,
//                       ),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           icon: Icon(Icons.search),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             SizedBox(
//               height: screenHeight * 0.75,
//               child: ListView.separated(
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                     height: 70,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text("Ali Riyami", style: TextStyle(fontSize: 19)),
//                             SizedBox(height: 3),
//                             Text("Liasion Engineer",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.black45)),
//                           ],
//                         ),
//                         Text("DA1079", style: TextStyle(fontSize: 18))
//                       ],
//                     ),
//                   );
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return Divider();
//                 },
//                 itemCount: 100,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
