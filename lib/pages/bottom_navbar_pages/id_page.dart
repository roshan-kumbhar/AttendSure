// import 'package:attendsure/firebase_services/std_details.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class IdPage extends StatelessWidget {
//   // final dynamic name;

//   // final dynamic erpNo;

//   // final dynamic branch;

//   // final dynamic semester;

//   // final dynamic photo;

//   // final dynamic studentdata;

//   final dynamic studentDetails;

//   const IdPage({super.key, required this.studentDetails});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           studentDetails['photo'] != null && studentDetails['photo'].isNotEmpty
//               ? Image.network(
//                   studentDetails['photo'],
//                   height: 100,
//                 )
//               : Text('No photo available'),
//           Text('Name: ${studentDetails['name'] ?? 'unknown'}'),
//           Text('ERP No: ${studentDetails['erpNo'] ?? 'unknown'}'),
//           Text('Branch: ${studentDetails['branch'] ?? 'unknown'}'),
//           Text('Semester: ${studentDetails['semester'] ?? 'unknown'}')
//           // Image.network(photo),
//           // Text('Name: ${StudentDetails}'),
//           // Text('ERP No: $erpNo'),
//           // Text('Branch: $branch'),
//           // Text('Semester: $semester'),
//         ],
//       ),
//     );
//   }
// }
