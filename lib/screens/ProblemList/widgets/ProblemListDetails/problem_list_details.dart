import 'package:assignment1/providers/ProblemListProvider/problem_list_provider.dart';
import 'package:assignment1/shared/Spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProblemListDetails extends StatelessWidget {
  const ProblemListDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<ProblemListProvider>().data.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: context.watch<ProblemListProvider>().data.length,
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
                                  .watch<ProblemListProvider>()
                                  .data[index]
                                  .name,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
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
                                          .watch<ProblemListProvider>()
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
                                      text: 'Status: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<ProblemListProvider>()
                                          .data[index]
                                          .status)
                                ]),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                                style: const TextStyle(fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: 'Comments: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade700)),
                                  TextSpan(
                                      text: context
                                          .watch<ProblemListProvider>()
                                          .data[index]
                                          .comments)
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
