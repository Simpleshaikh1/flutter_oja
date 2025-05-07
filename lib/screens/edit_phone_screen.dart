import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/customer_input_field.dart';

class EditPhoneScreen extends StatelessWidget {
  const EditPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController(text: '+1234567890');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
            CustomInputField(
              controller: phoneController,
              hintLabel: 'Phone Number',
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