import 'package:assignment1/shared/Spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/providers/ProcedureProvider/procedure_provider.dart';

class ProcedureDetails extends StatelessWidget {
  const ProcedureDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: context.watch<ProcedureProvider>().data.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: context.watch<ProcedureProvider>().data.length,
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
                      child: Row(children: <Widget>[
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                context
                                    .watch<ProcedureProvider>()
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
                                            .watch<ProcedureProvider>()
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
                                        text: 'Provider: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade700)),
                                    TextSpan(
                                        text: context
                                            .watch<ProcedureProvider>()
                                            .data[index]
                                            .provider)
                                  ]),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                  style: const TextStyle(fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text: 'Location: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade700)),
                                    TextSpan(
                                        text: context
                                            .watch<ProcedureProvider>()
                                            .data[index]
                                            .location)
                                  ]),
                            ),
                          ],
                        )),
                      ]),
                    ),
                  );
                },
              )
            : const Spinner());
  }
}
