import 'package:assignment1/providers/CareProvider/care_provider.dart';
import 'package:assignment1/shared/Spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CareDetails extends StatelessWidget {
  const CareDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<CareProvider>().data.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: context.watch<CareProvider>().data.length,
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
                          Text(
                            context.watch<CareProvider>().data[index].name,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Planned Date: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(text: context.watch<CareProvider>().data[index].date)
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
                                  TextSpan(text: context.watch<CareProvider>().data[index].instructions)
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
