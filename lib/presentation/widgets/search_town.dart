import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pick_pick/application/drop_state.dart';
import 'package:pick_pick/application/pickup_state.dart';
import 'package:pick_pick/presentation/screens/shipping_location_screen.dart';

import '../../application/place_provider.dart';
import '../../domain/place.dart';

class SearchTown extends ConsumerWidget {
  const SearchTown({
    required this.isPickup,
    super.key,
  });
  final bool isPickup;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final placesAsyncValue = ref.watch(placesProvider);
    final placesAsyncValue = ref.watch(filteredPlaceProvider);
    final searchForTownToggler =
        ref.watch(searchForTownTogglerProvider.notifier);
    final pickInfoController = ref.watch(pickUpInfoProvider.notifier);
    final dropInfoController = ref.watch(dropInfoProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const TextField(
            decoration: InputDecoration(
                hintText: "Town/ Wereda", icon: Icon(Icons.location_city)),
          ),
        ),
        Container(
            child: placesAsyncValue.when(
                data: (data) {
                  List<Place> places = data.toList();
                  print(places);
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.63,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: places.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  isPickup
                                      ? pickInfoController
                                          .setLocation(places[index])
                                      : dropInfoController
                                          .setLocation(places[index]);
                                  searchForTownToggler.toggle();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  right: 3),
                                              child: const Icon(
                                                  Icons.location_city_rounded)),
                                          Text(
                                            "${places[index].city}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  right: 3),
                                              child: const Icon(
                                                  Icons.location_on)),
                                          Text(
                                              places[index].zone != null &&
                                                      places[index]
                                                          .zone!
                                                          .isNotEmpty
                                                  ? "${places[index].zone}, ${places[index].title}"
                                                  : "${places[index].title}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                          // Text(
                                          //   "${places[index].title}",
                                          //   style: Theme.of(context)
                                          //       .textTheme
                                          //       .bodyLarge,
                                          // )
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                          }));
                },
                error: ((error, stackTrace) {
                  ref.invalidate(placesProvider);
                  return Text(error.toString());
                }),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )))
      ],
    );
  }
}
