import 'package:flutter/material.dart';

class TutorFormPage extends StatefulWidget {
  final String userId;

  TutorFormPage({required this.userId});

  @override
  _TutorFormPageState createState() => _TutorFormPageState();
}

class _TutorFormPageState extends State<TutorFormPage> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController feesController = TextEditingController();

  Future<void> saveTutorDetails() async {
    if (subjectController.text.isEmpty ||
        experienceController.text.isEmpty ||
        feesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // await FirebaseFirestore.instance.collection('users').doc(widget.userId).set({
    //   'role': 'Tutor',
    //   'subjects': subjectController.text,
    //   'experience': experienceController.text,
    //   'fees': feesController.text,
    // }, SetOptions(merge: true));

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12372A), // Dark Green Theme
      appBar: AppBar(
        title: Text('Tutor Details'),
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

                  // Subjects Taught
                  TextField(
                    controller: subjectController,
                    decoration: InputDecoration(
                      labelText: 'Subjects You Teach',
                      prefixIcon:
                          Icon(Icons.menu_book, color: Color(0xFF12372A)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Experience
                  TextField(
                    controller: experienceController,
                    decoration: InputDecoration(
                      labelText: 'Years of Experience',
                      prefixIcon:
                          Icon(Icons.timelapse, color: Color(0xFF12372A)),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),

                  // Fees Per Hour
                  TextField(
                    controller: feesController,
                    decoration: InputDecoration(
                      labelText: 'Fees per Hour',
                      prefixIcon:
                          Icon(Icons.attach_money, color: Color(0xFF12372A)),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),

                  // Save & Continue Button
                  ElevatedButton(
                    onPressed: saveTutorDetails,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1D5C42),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
