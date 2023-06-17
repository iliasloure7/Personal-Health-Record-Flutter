import 'package:assignment1/models/problem_list_model.dart';
import 'package:assignment1/providers/ProblemListProvider/problem_list_provider.dart';
import 'package:assignment1/shared/SubmitButton/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assignment1/shared/TextFormField/custom_text_form_field.dart';
import 'package:assignment1/utils/helpers.dart';
import 'package:provider/provider.dart';

class ProblemListForm extends StatefulWidget {
  const ProblemListForm({super.key});

  @override
  State<ProblemListForm> createState() => _ProblemListFormState();
}

class _ProblemListFormState extends State<ProblemListForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _statusController = TextEditingController();
  final _commentsController = TextEditingController();

  void _setNewProblemData() {
    context.read<ProblemListProvider>().setProblemData(ProblemListData(
        name: _nameController.text,
        date: getTransformedDateToValidChartFormat(_dateController.text),
        status: _statusController.text,
        comments: _commentsController.text));
  }

  void _clearFields() {
    _nameController.text = '';
    _dateController.text = '';
    _statusController.text = '';
    _commentsController.text = '';
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Data was added successfully!'),
            backgroundColor: Colors.green),
      );

      _setNewProblemData();
      setNewChartData(context, _nameController.text, _dateController.text);
      _clearFields();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _statusController.dispose();
    _commentsController.dispose();
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
              child: Text('Add Problem',
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
                label: 'Enter status',
                controller: _statusController,
                icon: FontAwesomeIcons.userDoctor,
                textFormValidator: textFormFieldValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              child: CustomTextFormField(
                label: 'Enter comments',
                controller: _commentsController,
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
