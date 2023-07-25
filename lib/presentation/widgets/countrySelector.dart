import 'package:flutter/material.dart';

import '../../constants.dart';

class CountrySelectorDialog extends StatelessWidget {
  final Function callback;
  const CountrySelectorDialog({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Country"),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.height * 0.6,
        child: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  callback(countries.elementAt(index));
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          countries.elementAt(index).name,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        Text(
                          countries.elementAt(index).flag,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.fontSize),
                        ),
                      ]),
                ),
              );
            }),
      ),
    );
  }
}
