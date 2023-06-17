import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/shared/TextFormField/custom_text_form_field.dart';
import 'package:assignment1/models/medication_model.dart';
import 'package:assignment1/providers/MedicationProvider/medication_provider.dart';
import 'package:assignment1/shared/SubmitButton/submit_button.dart';
import 'package:assignment1/utils/helpers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicationForm extends StatefulWidget {
  const MedicationForm({super.key});

  @override
  State<MedicationForm> createState() => _MedicationFormState();
}

class _MedicationFormState extends State<MedicationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _doseController = TextEditingController();
  final _rateController = TextEditingController();
  final _instructionController = TextEditingController();
  final _prescribeController = TextEditingController();

  void _setNewMedicationData() {
    context.read<MedicationProvider>().setMedication(MedicationData(
          name: _nameController.text,
          date: getTransformedDateToValidChartFormat(_dateController.text),
          dose: int.parse(_doseController.text),
          rate: int.parse(_rateController.text),
          instructions: _instructionController.text,
          prescriber: _prescribeController.text,
        ));
  }

  void _clearFields() {
    _nameController.text = '';
    _dateController.text = '';
    _doseController.text = '';
    _rateController.text = '';
    _instructionController.text = '';
    _prescribeController.text = '';
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Data was added successfully!'),
            backgroundColor: Colors.green),
      );

      _setNewMedicationData();
      setNewChartData(context, _nameController.text, _dateController.text);
      _clearFields();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _doseController.dispose();
    _rateController.dispose();
    _instructionController.dispose();
    _prescribeController.dispose();
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
              child: Text('Add Medication',
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
                icon: FontAwesomeIcons.notesMedical,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter date',
                controller: _dateController,
                icon: FontAwesomeIcons.calendarDays,
                textFormValidator: dateFormFieldValidator,
                onTap: () => showDatePickerDialog(context, _dateController),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter dose',
                controller: _doseController,
                inputType: TextInputType.number,
                icon: FontAwesomeIcons.syringe,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter rate',
                controller: _rateController,
                inputType: TextInputType.number,
                icon: FontAwesomeIcons.waveSquare,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter instructions',
                controller: _instructionController,
                icon: FontAwesomeIcons.personChalkboard,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter prescriber',
                controller: _prescribeController,
                icon: FontAwesomeIcons.userDoctor,
                textFormValidator: textFormFieldValidator,
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
