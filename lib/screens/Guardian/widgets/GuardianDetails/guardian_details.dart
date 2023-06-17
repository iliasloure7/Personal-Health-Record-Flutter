import 'package:assignment1/providers/GuardianProvider/guardian_provider.dart';
import 'package:assignment1/shared/Spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GuardianDetails extends StatelessWidget {
  const GuardianDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<GuardianProvider>().data.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: context.watch<GuardianProvider>().data.length,
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
                                          .watch<GuardianProvider>()
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
                                      text: 'Role: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<GuardianProvider>()
                                          .data[index]
                                          .role)
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
                                          .watch<GuardianProvider>()
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
                                          .watch<GuardianProvider>()
                                          .data[index]
                                          .telephone)
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
