import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assignment1/shared/TextFormField/custom_text_form_field.dart';
import 'package:assignment1/models/procedure_model.dart';
import 'package:assignment1/providers/ProcedureProvider/procedure_provider.dart';
import 'package:assignment1/shared/SubmitButton/submit_button.dart';
import 'package:assignment1/utils/helpers.dart';

class ProcedureForm extends StatefulWidget {
  const ProcedureForm({super.key});

  @override
  State<ProcedureForm> createState() => _ProcedureFormState();
}

class _ProcedureFormState extends State<ProcedureForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _providerController = TextEditingController();
  final _locationController = TextEditingController();

  void _setNewProcedureData() {
    context.read<ProcedureProvider>().setProcedure(ProcedureData(
        name: _nameController.text,
        date: getTransformedDateToValidChartFormat(_dateController.text),
        provider: _providerController.text,
        location: _locationController.text));
  }

  void _clearFields() {
    _nameController.text = '';
    _dateController.text = '';
    _providerController.text = '';
    _locationController.text = '';
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Data was added successfully!'),
            backgroundColor: Colors.green),
      );

      _setNewProcedureData();
      setNewChartData(context, _nameController.text, _dateController.text);
      _clearFields();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _providerController.dispose();
    _locationController.dispose();
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
              child: Text('Add Procedure',
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
                icon: FontAwesomeIcons.bedPulse,
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
                label: 'Enter provider',
                controller: _providerController,
                icon: FontAwesomeIcons.userDoctor,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter location',
                controller: _locationController,
                icon: FontAwesomeIcons.locationDot,
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
