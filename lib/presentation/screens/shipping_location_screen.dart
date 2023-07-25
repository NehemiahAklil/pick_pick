import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pick_pick/application/drop_state.dart';
import 'package:pick_pick/application/pickup_state.dart';
import 'package:pick_pick/application/place_provider.dart';
import 'package:pick_pick/presentation/widgets/button.dart';

import '../widgets/search_town.dart';

class ShippingLocation extends ConsumerWidget {
  const ShippingLocation({required this.isPickup, super.key});
  final bool isPickup;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchForTownToggler = ref.watch(searchForTownTogglerProvider);
    final pickUpInfo = ref.watch(pickUpInfoProvider);
    final dropInfo = ref.watch(dropInfoProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            isPickup ? "Pickup Location" : "Drop Location",
            style: TextStyle(
                color: Colors.green.shade900, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home_filled)),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: searchForTownToggler
                ? const EdgeInsets.symmetric(vertical: 20)
                : const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                      visible: searchForTownToggler,
                      child: SearchTown(
                        isPickup: isPickup,
                      )),
                  Visibility(
                    visible: !searchForTownToggler,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                            isPickup
                                ? "General Pickup Location"
                                : "General Drop Location",
                            style: Theme.of(context).textTheme.titleLarge),
                        InkWell(
                          onTap: () {
                            ref
                                .read(searchForTownTogglerProvider.notifier)
                                .toggle();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 8.0),
                                            child: const Icon(
                                                Icons.location_city_rounded),
                                          ),
                                          const Text(
                                            "Town/Werada",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(isPickup
                                          ? pickUpInfo.location.city ??
                                              "Abarqoro"
                                          : dropInfo.location.city ??
                                              "Abarqoro"),
                                    ]),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 8.0),
                                            child: const Icon(Icons.map),
                                          ),
                                          const Text(
                                            "Zone",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(isPickup
                                          ? pickUpInfo.location.title ??
                                              "Shebele"
                                          : dropInfo.location.title ??
                                              "Shebele"),
                                    ]),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 8.0),
                                            child: const Icon(
                                                Icons.flag_circle_rounded),
                                          ),
                                          Text(
                                            "Region",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(isPickup
                                          ? pickUpInfo.location.zone ?? "Somali"
                                          : dropInfo.location.zone ?? "Somali"),
                                    ])
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 8.0),
                                          child:
                                              const Icon(Icons.domain_rounded),
                                        ),
                                        const Text(
                                          "Kebele",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text("Kebele 01"),
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomButton(
                        btnText: "Confirm",
                        onPressedCallback: () {
                          return Navigator.of(context).pop();
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
