import 'package:flutter/material.dart';

class CotizationScreen extends StatefulWidget {
  const CotizationScreen({Key? key}) : super(key: key);

  @override
  State<CotizationScreen> createState() => _CotizationScreenState();
}

class _CotizationScreenState extends State<CotizationScreen> {
  final energyController = TextEditingController();
  final materialController = TextEditingController();

  calculate() {
    const double vatiosImpresion = 360;
    const double kwhconverter = vatiosImpresion / 1000;

    const double costEnergyKwh = 3;

    const double materialCost = 500;
    const double materialWeight = 950;

    final double energy = double.parse(energyController.text);
    final double material = double.parse(materialController.text);
    final double total = (energy * kwhconverter * costEnergyKwh) +
        (material * materialCost / materialWeight);
    showDialog(
        barrierColor: Colors.black.withOpacity(0.9),
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text('Total'),
            content: Text('Pesos MXN: $total'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(), 
                child: const Text('Guardar')
              ),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Convertir en PDF')
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    const String title = 'Cotización';
    const String labelEnergy = 'Energía';
    const String labelMaterial = 'Material';

    const double padding = 30;

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text(title))),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const FadeInImage(
                      image: NetworkImage(
                          'https://www.3dnatives.com/es/wp-content/uploads/sites/4/W3DP_Cover3.jpg'),
                      placeholder: AssetImage("assets/jar-loading.gif"),
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 200),
                    ),
                    const SizedBox(height: padding * 2),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Impresora',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Ender 3"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Ender 3 Neo"),
                        )
                      ],
                      onChanged: (value) => print(value),
                    ),
                    const SizedBox(height: padding),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tipo de impresión',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("PLA"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("TPU"),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text("ABS"),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text("PETG"),
                        )
                      ],
                      onChanged: (value) => print(value),
                    ),
                    const SizedBox(
                      height: padding,
                    ),
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
                    ),
                    const SizedBox(height: padding),
                    ElevatedButton(
                        onPressed: () {
                          calculate();
                        },
                        child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.calculate),
                                SizedBox(width: 10),
                                Text("Calcular", style: TextStyle(fontSize: 20))
                              ],
                            )))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
