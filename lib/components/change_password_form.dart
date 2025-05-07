import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/auth_form_validator.dart';

class ChangePasswordForm extends StatefulWidget {
  final Function(String oldPass, String newPass) onSave;
  final GlobalKey<FormState> formKey;

  const ChangePasswordForm({
    super.key,
    required this.onSave,
    required this.formKey,
  });

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _oldPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(_oldPassController.text, _newPassController.text);
    }
  }

  InputDecoration _passwordDecoration(String label, bool obscure, VoidCallback toggle) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      suffixIcon: IconButton(
        icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
        onPressed: toggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _oldPassController,
            obscureText: _obscureOld,
            decoration: _passwordDecoration('Old Password', _obscureOld, () {
              setState(() => _obscureOld = !_obscureOld);
            }),
            validator: (val) =>
            val == null || val.isEmpty ? 'Enter old password' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _newPassController,
            obscureText: _obscureNew,
            decoration: _passwordDecoration('New Password', _obscureNew, () {
              setState(() => _obscureNew = !_obscureNew);
            }),
            validator: AuthFormValidator.validatePassword,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPassController,
            obscureText: _obscureConfirm,
            decoration: _passwordDecoration('Confirm New Password', _obscureConfirm, () {
              setState(() => _obscureConfirm = !_obscureConfirm);
            }),
            validator: (val) {
              if (val == null || val.isEmpty) return 'Confirm password';
              if (val != _newPassController.text) return 'Passwords do not match';
              return null;
            },
          ),
        ],
      ),
    );
  }
}
