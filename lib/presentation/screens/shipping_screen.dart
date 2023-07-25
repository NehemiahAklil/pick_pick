import 'package:flutter/material.dart';
import 'package:pick_pick/presentation/widgets/button.dart';
import '../forms/DropForm.dart';
import '../forms/PickupForm.dart';

class PickPickApp extends StatelessWidget {
  const PickPickApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Pickup/Drop",
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
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PickupForm(),
                    DropForm(),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomButton(
                btnText: "Next",
                onPressedCallback: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
