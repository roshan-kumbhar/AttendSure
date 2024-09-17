import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherDetails extends StatefulWidget {
  final String erpNo;
  const TeacherDetails({super.key, required this.erpNo});

  @override
  _TeacherDetailsState createState() => _TeacherDetailsState();
}
class _TeacherDetailsState extends State<TeacherDetails> {
  Future<DocumentSnapshot<Map<String, dynamic>>> getTeacherData() async {
    return await FirebaseFirestore.instance
        .collection('teacher')
        .doc(widget.erpNo)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getTeacherData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          }

          if (!snapshot.hasData || snapshot.data?.data() == null) {
            // Handle case where no data is found or document is null
            return Center(child: Text('No data found for this teacher'));
          }

          // Safely cast the document data to Map<String, dynamic>
          var teacherData = snapshot.data!.data()!;

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
                teacherData['photo'] != null
                    ? Center(
                        child: Image.network(
                          teacherData['photo'],
                          width: 100,
                          height: 100,
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
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(': ${teacherData['name']}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text('ERP No',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(': ${teacherData['erpNo']}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text('Branch',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(': ${teacherData['branch']}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                    Text("Sign of Teacher",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Sign of Principal",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
