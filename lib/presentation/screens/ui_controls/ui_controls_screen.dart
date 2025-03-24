import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Trasnportation { car, bike, boat, plane }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Trasnportation groupValue = Trasnportation.car;

  bool wantsBreakfast = false; // Variable para checkbox
  bool wantsLunch = false; // Variable para checkbox
  bool wantsDinner = false; // Variable para checkbox

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            value: true,
            onChanged: (value) => setState(() => isDeveloper = !isDeveloper)
            ),
        // Expansion de los Tiles creados
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$groupValue'),
          children: [
            RadioListTile(
                value: Trasnportation.car,
                groupValue: groupValue,
                onChanged: (value) => setState(
                      () {
                        groupValue = Trasnportation.car;
                      },
                    )),
            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Viajar por Bote '),
                value: Trasnportation.boat,
                groupValue: groupValue,
                onChanged: (value) => setState(
                      () {
                        groupValue = Trasnportation.boat;
                      },
                    )),
            RadioListTile(
                title: const Text('By Bike'),
                subtitle: const Text('Viajar por bicicleta'),
                value: Trasnportation.bike,
                groupValue: groupValue,
                onChanged: (value) => setState(
                      () {
                        groupValue = Trasnportation.bike;
                      },
                    )),
            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Viajar por Avion'),
                value: Trasnportation.plane,
                groupValue: groupValue,
                onChanged: (value) => setState(
                      () {
                        groupValue = Trasnportation.plane;
                      },
                    )),
          ],
        ),
        // Checkbox basado en dos booleanos obligatorios
        CheckboxListTile(
          title: const Text('Desayuno?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
