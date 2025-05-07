import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/customer_input_field.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController(text: 'John');
    final lastNameController = TextEditingController(text: 'Doe');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Name', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
        child: Column(
          children: [
            CustomInputField(
              controller: firstNameController,
              hintText: 'First Name',
              hintLabel: 'First Name',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 40),
            CustomInputField(
              controller: lastNameController,
              hintLabel: 'Last Name',
              hintText: 'Last Name',
              prefixIcon: Icons.person_outline,
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
