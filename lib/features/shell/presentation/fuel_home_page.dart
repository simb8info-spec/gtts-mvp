import 'package:flutter/material.dart';
import 'fuel_page.dart';

class FuelHomePage extends StatelessWidget {
  const FuelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // IMPORTANT: FuelPage should preferably be content-only.
    // If FuelPage still has Scaffold, it will still render, but later we can refactor.
    return const FuelPage();
  }
}
