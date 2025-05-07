import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/customer_input_field.dart';

class EditEmailScreen extends StatelessWidget {
  const EditEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: 'john.doe@example.com');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
              controller: emailController,
              hintLabel: 'Change Email',
              hintText: 'Email',
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 10,),
            Text('We will Send verification to your New Email', style: TextStyle(color: Colors.lightBlueAccent),),
            const Spacer(),
            CustomButton(label: 'Change Email', onTap: (){
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}