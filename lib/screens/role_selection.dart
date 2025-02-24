
import 'package:flutter/material.dart';
import 'tutor_form.dart';
import 'student_form.dart';

class RoleSelectionPage extends StatefulWidget {
  final String userId;

  RoleSelectionPage({required this.userId});

  @override
  _RoleSelectionPageState createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String? selectedRole;

  void navigateToForm() {
    if (selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a role')),
      );
      return;
    }

    if (selectedRole == 'Tutor') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TutorFormPage(userId: widget.userId)),
      );
    } else if (selectedRole == 'Student') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentFormPage(userId: widget.userId)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12372A), 
      appBar: AppBar(
        title: Text('Select Role'),
        centerTitle: true,
        backgroundColor: Color(0xFF12372A),
      ),
      body: Center(
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Choose Your Role',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF12372A),
                  ),
                ),
                SizedBox(height: 20),

                // Dropdown for role selection
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Role',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedRole,
                  items: ['Tutor', 'Student'].map((role) {
                    return DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value;
                    });
                  },
                ),
                SizedBox(height: 20),

                // Continue Button
                ElevatedButton(
                  onPressed: navigateToForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1D5C42),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
