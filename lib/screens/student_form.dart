
import 'package:flutter/material.dart';

class StudentFormPage extends StatefulWidget {
  final String userId;

  StudentFormPage({required this.userId});

  @override
  _StudentFormPageState createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();

  Future<void> saveStudentDetails() async {
    if (gradeController.text.isEmpty || subjectController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // await FirebaseFirestore.instance.collection('users').doc(widget.userId).set({
    //   'role': 'Student',
    //   'grade': gradeController.text,
    //   'interested_subjects': subjectController.text,
    // }, SetOptions(merge: true));

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12372A), // Dark Green Theme
      appBar: AppBar(
        title: Text('Student Details'),
        backgroundColor: Color(0xFF12372A),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter Your Details',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF12372A),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Grade Field
                  TextField(
                    controller: gradeController,
                    decoration: InputDecoration(
                      labelText: 'Current Grade/Class',
                      prefixIcon: Icon(Icons.school, color: Color(0xFF12372A)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Interested Subjects Field
                  TextField(
                    controller: subjectController,
                    decoration: InputDecoration(
                      labelText: 'Subjects Interested In',
                      prefixIcon: Icon(Icons.book, color: Color(0xFF12372A)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Save & Continue Button
                  ElevatedButton(
                    onPressed: saveStudentDetails,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1D5C42),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Save & Continue',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
