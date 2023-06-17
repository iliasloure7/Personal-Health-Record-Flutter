import 'package:assignment1/providers/MedicationProvider/medication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/shared/Spinner/spinner.dart';

class MedicationDetails extends StatelessWidget {
  const MedicationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<MedicationProvider>().data.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: context.watch<MedicationProvider>().data.length,
            separatorBuilder: (context, int index) =>
                const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              context
                                  .watch<MedicationProvider>()
                                  .data[index]
                                  .name,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Date: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<MedicationProvider>()
                                          .data[index]
                                          .date)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Dose: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text:
                                          '${context.watch<MedicationProvider>().data[index].dose} / puffs')
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Rate: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text:
                                          '${context.watch<MedicationProvider>().data[index].rate} / day')
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Instructions: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<MedicationProvider>()
                                          .data[index]
                                          .instructions)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Name of Prescriber: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<MedicationProvider>()
                                          .data[index]
                                          .prescriber)
                                ]),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              );
            },
          )
        : const Spinner();
  }
}
