import 'package:flutter/material.dart';
import 'package:oja/components/auth_form_validator.dart';

class BaseAuthForm extends StatefulWidget {
  final bool isLogin;
  final Function(String, String, String?) onSubmit;

  const BaseAuthForm({
    super.key,
    required this.isLogin,
    required this.onSubmit,
  });

  @override
  State<BaseAuthForm> createState() => _BaseAuthFormState();
}

class _BaseAuthFormState extends State<BaseAuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;

  final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue[900]!,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(8.0),
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        _emailController.text,
        _passwordController.text,
        widget.isLogin ? null : _nameController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!widget.isLogin) ...[
              TextFormField(
                controller: _nameController,
                cursorColor: const Color.fromARGB(255, 4, 15, 24),
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  prefixIconColor: MaterialStateColor.resolveWith((states) {
                    return states.contains(MaterialState.focused)
                        ? const Color.fromARGB(
                        255, 4, 15, 24)
                        : Colors.grey;
                  }),
                  hintText: 'Full Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 4, 15, 24), width: 2.0),
                  ),
                ),
                validator: AuthFormValidator.validateName,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 20,
              )
            ],
            TextFormField(
              controller: _emailController,
              cursorColor: const Color.fromARGB(255, 4, 15, 24),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
                prefixIconColor: MaterialStateColor.resolveWith((states) {
                  return states.contains(MaterialState.focused)
                      ? const Color.fromARGB(
                      255, 4, 15, 24)
                      : Colors.grey;
                }),
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 4, 15, 24), width: 2.0),
                ),
              ),
              validator: AuthFormValidator.validateEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              cursorColor: const Color.fromARGB(255, 4, 15, 24),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                ),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                prefixIconColor: MaterialStateColor.resolveWith((states) {
                  return states.contains(MaterialState.focused)
                      ? const Color.fromARGB(
                      255, 4, 15, 24)
                      : Colors.grey;
                }),
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 4, 15, 24), width: 2.0),
                ),
              ),
              validator: AuthFormValidator.validatePassword,
              keyboardType: TextInputType.text,

            ),
            const SizedBox(height: 20),
            if (!widget.isLogin) ...[
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscurePassword,
                cursorColor: const Color.fromARGB(255, 4, 15, 24),
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: (){
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  prefixIconColor: MaterialStateColor.resolveWith((states) {
                    return states.contains(MaterialState.focused)
                        ? const Color.fromARGB(
                        255, 4, 15, 24)
                        : Colors.grey;
                  }),
                  hintText: 'Password Again',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 4, 15, 24), width: 2.0),
                  ),
                ),
                validator: AuthFormValidator.validatePassword,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              )
            ],
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color.fromARGB(255, 221, 119, 24),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                widget.isLogin ? 'Sign in' : 'Sign Up',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
