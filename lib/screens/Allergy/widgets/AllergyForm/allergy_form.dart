import 'dart:io';

import 'package:assignment1/models/allergy_model.dart';
import 'package:assignment1/providers/AlleryProvider/allergy_provider.dart';
import 'package:assignment1/shared/SubmitButton/submit_button.dart';
import 'package:assignment1/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assignment1/shared/TextFormField/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AllergyForm extends StatefulWidget {
  const AllergyForm({super.key});

  @override
  State<AllergyForm> createState() => _AllergyFormState();
}

class _AllergyFormState extends State<AllergyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _reactionController = TextEditingController();
  final _severityController = TextEditingController();

  File? _storedImage;

  void _setAllergyData() {
    context.read<AllergyProvider>().setAllergy(AllergyData(
        name: _nameController.text,
        reaction: _reactionController.text,
        severity: _severityController.text));
  }

  void _clearFields() {
    _nameController.text = '';
    _reactionController.text = '';
    _severityController.text = '';
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Data was added successfully!'),
            backgroundColor: Colors.green),
      );

      _setAllergyData();
      _clearFields();
    }
  }

  Future _takePicture(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _storedImage = imageTemporary);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _reactionController.dispose();
    _severityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Add Allergy',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter name',
                controller: _nameController,
                icon: FontAwesomeIcons.personDotsFromLine,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter reaction',
                controller: _reactionController,
                icon: FontAwesomeIcons.childReaching,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter severity',
                controller: _severityController,
                icon: FontAwesomeIcons.starHalfStroke,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 0,
                    child: ElevatedButton(
                      onPressed: () => _takePicture(ImageSource.camera),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[800]),
                      child: Row(
                        children: const <Widget>[
                          Text('Pick camera', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Icon(FontAwesomeIcons.cameraRetro)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: _storedImage != null
                            ? Image.file(_storedImage!, width: 100, height: 100)
                            : const Text('No image taken'),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child:
                  SubmitButton(formKey: _formKey, validateForm: _validateForm),
            ),
          ],
        ),
      ),
    );
  }
}
