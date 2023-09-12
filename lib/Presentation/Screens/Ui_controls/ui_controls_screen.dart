import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = "ui_controls_screen";
  const UiControlsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: const _uiControlsView(),
    );
  }
}

class _uiControlsView extends StatefulWidget {
  const _uiControlsView();

  @override
  State<_uiControlsView> createState() => _uiControlsViewState();
}

enum TransportationMode { car, bike, submarine, plane }

class _uiControlsViewState extends State<_uiControlsView> {
  bool isDeveloper = true;
  TransportationMode selectedTransportation = TransportationMode.car;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: Text("Vehiculo de transporte"),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Viajar por carro'),
              value: TransportationMode.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = TransportationMode.car;
              }),
            ),
            RadioListTile(
              title: const Text('Bike'),
              subtitle: const Text('Viajar por bicicleta'),
              value: TransportationMode.bike,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = TransportationMode.bike;
              }),
            ),
            RadioListTile(
              title: const Text('Plane'),
              subtitle: const Text('Viajar por avión'),
              value: TransportationMode.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = TransportationMode.plane;
              }),
            ),
            RadioListTile(
              title: const Text('Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: TransportationMode.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = TransportationMode.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
            title: const Text('Breakfast?'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text('Lunch?'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text('Dinner?'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}
