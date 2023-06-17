import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function validateForm;

  const SubmitButton({super.key, required this.formKey, required this.validateForm});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => validateForm(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo, // Background color
        ),
        child: const Text('Submit', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
