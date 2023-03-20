import 'package:flutter/material.dart';

class CotizationScreen extends StatefulWidget {
  const CotizationScreen({Key? key}) : super(key: key);

  @override
  State<CotizationScreen> createState() => _CotizationScreenState();
}

class _CotizationScreenState extends State<CotizationScreen> {
  final energyController = TextEditingController();
  final materialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const String title = 'Cotización';
    const String labelEnergy = 'Energía';
    const String labelMaterial = 'Material';

    const double padding = 30;

    const double vatiosImpresion = 360;
    const double kwhconverter = vatiosImpresion / 1000;

    const double costEnergyKwh = 3;

    const double materialCost = 500;
    const double materialWeight = 950;

    return Scaffold(
        appBar: AppBar(title: const Center(child: Text(title))),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: labelEnergy,
                  ),
                  controller: energyController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: padding),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: labelMaterial,
                  ),
                  controller: materialController,
                  keyboardType: TextInputType.number,
                )
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              final double energy = double.parse(energyController.text);
              final double material = double.parse(materialController.text);
              final double total = (energy * kwhconverter * costEnergyKwh) +
                  (material * materialCost / materialWeight);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Total'),
                      content: Text('Pesos MXN: $total'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        )
                      ],
                    );
                  });
            },
            child: const Icon(Icons.calculate)));
  }
}
