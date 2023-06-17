import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final IconData icon;
  final Function(String?) textFormValidator;
  final VoidCallback? onTap;

  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon,
      required this.textFormValidator,
      this.inputType = TextInputType.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => textFormValidator(value),
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Align(
          widthFactor: 1,
          heightFactor: 1,
          child: FaIcon(icon),
        ),
      ),
      onTap: onTap,
    );
  }
}
