import 'package:flutter/material.dart';
import 'package:oja/screens/address_screen.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _country;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _street1Controller = TextEditingController();
  final TextEditingController _street2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final List<String> _countries = ['USA', 'Canada', 'Nigeria', 'UK', 'India'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const Divider(thickness: 1, height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Country or Region'),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      items: _countries.map((country) {
                        return DropdownMenuItem(value: country, child: Text(country));
                      }).toList(),
                      onChanged: (value) => setState(() => _country = value),
                      validator: (value) => value == null ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('First Name'),
                    _buildTextField(_firstNameController),

                    _buildLabel('Last Name'),
                    _buildTextField(_lastNameController),

                    _buildLabel('Street Address'),
                    _buildTextField(_street1Controller),

                    _buildLabel('Street Address 2 (Optional)'),
                    _buildTextField(_street2Controller, required: false),

                    _buildLabel('City'),
                    _buildTextField(_cityController),

                    _buildLabel('State/Province/Region'),
                    _buildTextField(_stateController),

                    _buildLabel('Zip Code'),
                    _buildTextField(_zipController),

                    _buildLabel('Phone Number'),
                    _buildTextField(_phoneController, keyboardType: TextInputType.phone),

                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const AddressScreen()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.orange,
                        ),
                        child: const Text('Add Address', style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 16),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }

  Widget _buildTextField(TextEditingController controller,
      {bool required = true, TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      validator: (value) => required && (value == null || value.isEmpty) ? 'Required' : null,
    );
  }
}
