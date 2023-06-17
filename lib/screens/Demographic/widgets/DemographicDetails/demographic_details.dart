import 'package:assignment1/providers/DemographicProvider/demographic_provider.dart';
import 'package:assignment1/shared/Spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemographicDetails extends StatelessWidget {
  const DemographicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<DemographicProvider>().data.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: context.watch<DemographicProvider>().data.length,
            separatorBuilder: (context, int index) =>
                const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Card(
                elevation: 5.0,
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
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .fullName,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Gender: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .gender)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Martial Status: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .martialStatus)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Religious Affiliation: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .religion)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Ethnicity: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .ethnicity)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Language Spoken: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .language)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Address: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .address)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Telephone: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .telephone)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Birthday: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<DemographicProvider>()
                                          .data[index]
                                          .birthday)
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
