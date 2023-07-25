import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pick_pick/application/drop_state.dart';
import 'package:pick_pick/presentation/screens/shipping_location_screen.dart';
import '../../domain/country.dart';
import '../widgets/countrySelector.dart';

class DropForm extends ConsumerWidget {
  const DropForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDropFormVisible = ref.watch(dropFormTogglerProvider);
    final dropInfo = ref.watch(dropInfoProvider);

    void _selectCountry(Country dropCountry) async {
      print("Drop Country Changed to ${dropInfo.country}");
      await ref.read(dropInfoProvider.notifier).setCountry(dropCountry);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Drop Information",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                InkWell(
                    onTap: () {
                      ref.read(dropFormTogglerProvider.notifier).toggle();
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: isDropFormVisible
                            ? const Icon(Icons.minimize)
                            : const Icon(Icons.add)))
              ],
            ),
          ),
          Visibility(
            visible: isDropFormVisible,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text("Date", style: Theme.of(context).textTheme.titleLarge),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.calendar_today),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Date",
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("ሐምሌ 10/2015"), Text("July 17/2023")],
                      ),
                    ],
                  ),
                ),
                Text("Shipping Address",
                    style: Theme.of(context).textTheme.titleLarge),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CountrySelectorDialog(
                                    callback: _selectCountry);
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.flag),
                                Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Drop Country",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )),
                              ],
                            ),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(dropInfo.country.name),
                              ),
                              Text(
                                dropInfo.country.flag,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ])
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ShippingLocation(
                                    isPickup: false,
                                  )));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              height: 40,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Drop Location",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    "${dropInfo.location.title} | ${dropInfo.location.city} | Zone | ${dropInfo.location.zone}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_city),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Drop Specific Location",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  TextField(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall, // Apply the "BodySmall" text style
                                      decoration: const InputDecoration(
                                        hintText: "Enter Your Specific Region",
                                        isDense:
                                            true, // Reduce the height of the TextField
                                        border: InputBorder
                                            .none, // Remove the border
                                      )),
                                  // Text(
                                  //   "Enter Your Specific Region",
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .bodySmall!
                                  //       .copyWith(color: Colors.grey.shade700),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
