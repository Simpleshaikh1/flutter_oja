import 'package:flutter/material.dart';
import 'package:oja/components/change_password_form.dart';
import 'package:oja/components/add_to_cart.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // References to controllers to get password values (optional, depending on how you manage state)
  String _oldPass = '';
  String _newPass = '';

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      // Pass values to your API logic
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
            Expanded(
              child: SingleChildScrollView(
                child: ChangePasswordForm(
                  formKey: _formKey,
                  onSave: (oldPass, newPass) {
                    _oldPass = oldPass;
                    _newPass = newPass;
                    _handleSave();
                  },
                ),
              ),
            ),
            CustomButton(
              label: 'Save',
              onTap: _handleSave,
            ),
          ],
        ),
      ),
    );
  }
}
