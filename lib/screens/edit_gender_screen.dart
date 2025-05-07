import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedGender = 'Male';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              items: ['Male', 'Female', 'Other'].map((gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                // Handle selection
              },
              decoration: InputDecoration(
                labelText: 'Choose Gender',
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 4, 15, 24), width: 2.0),
                ),
                border: const OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.black),
              dropdownColor: Colors.white,
            ),

            const Spacer(),
            CustomButton(label: 'Save', onTap: (){
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
