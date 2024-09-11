import 'package:attendsure/pages/bottom_navbar_pages/id_page.dart';
import 'package:attendsure/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  final String erpNo;

  StudentDetails({required this.erpNo});

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  Future<DocumentSnapshot<Map<String, dynamic>>> getStudentData() async {
    return await FirebaseFirestore.instance
        .collection('students')
        .doc(widget.erpNo)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      body: FutureBuilder<DocumentSnapshot>(
        future: getStudentData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Show a loading indicator while waiting
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          }

          if (snapshot.hasData && snapshot.data != null) {
            var studentData = snapshot.data!.data() as Map<String, dynamic>;

            return Container(
              margin: EdgeInsets.symmetric(vertical: 85, horizontal: 25),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/Logo Ltjss.png",
                        width: 55,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Lokmanya Tilak College of Engineering",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Navi Mumbai",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  studentData['photo'] != null
                      ? Center(
                          child: Image.network(
                            studentData['photo'],
                            width: 100,
                          ),
                        )
                      : Text('No photo available'),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text('Name',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(': ${studentData['name']}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text('ERP No',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(': ${studentData['erpNo']}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text('Branch',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(': ${studentData['branch']}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text('Roll No',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(': ${studentData['rollno']}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text('Semester',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(': ${studentData['semester']}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Sign of Student",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Sign of Principal",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            );
          }

          return Center(child: Text('No data found'));
        },
      ),
    );
  }
}
