import 'package:assignment1/providers/ImmunizationProvider/immunization_provider.dart';
import 'package:assignment1/shared/Spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImmunizationDetails extends StatelessWidget {
  const ImmunizationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<ImmunizationProvider>().data.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: context.watch<ImmunizationProvider>().data.length,
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
                    children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              context.watch<ImmunizationProvider>().data[index].name,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
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
                                    TextSpan(text: context.watch<ImmunizationProvider>().data[index].date)
                                  ]),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                  style: const TextStyle(fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text: 'Type: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade700)),
                                    TextSpan(text: context.watch<ImmunizationProvider>().data[index].type)
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
                                            '${context.watch<ImmunizationProvider>().data[index].dose} / mcg')
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
                                    TextSpan(text: context.watch<ImmunizationProvider>().data[index].instructions)
                                  ]),
                            ),
                          ])),
                    ],
                  ),
                ),
              );
            },
          )
        : const Spinner();
  }
}
