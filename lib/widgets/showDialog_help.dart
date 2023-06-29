import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialogHelpWidget extends StatelessWidget {
  const ShowDialogHelpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Ayuda", style: TextStyle(fontSize: 20, color: Colors.black)),
        content: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(height: 20),
                Text("Renta local: Costo de renta del local"),
                SizedBox(height: 20),
                Text("Luz: Costo de luz del local"),
                SizedBox(height: 20),
                Text("Margen de ganancia: Margen de ganancia que se desea obtener"),
                SizedBox(height: 20),
                Text("Horas impresion: Horas que se imprime al dia (8 horas de preferencia para no estar apurados))"),
                SizedBox(height: 20),
                Text("Dias impresion: Dias que se imprime a la semana (5 dias de preferencia para no estar apurados)"),
                SizedBox(height: 20),
                Text("Margen de error: Margen de error que se pueda tener obtener"),
                SizedBox(height: 20),
                Text("Margen de filamento: Margen de filamento que se pueda usar dependiendo las herramientas que se tenga"),
                SizedBox(height: 20),
                Text("Desgaste impresion: Desgaste de la impresora o cada cuanto se hace mantenimiento"),
                SizedBox(height: 20),
                Text("Costo desgaste: Costo de desgaste de la impresora o mantenimiento"),
                SizedBox(height: 20),
                Text("Validacion: En cuanto tiempo despues de dar la cotizacion a tu cliente tiene este para que se le respete el precio"),
                SizedBox(height: 20),
                Text("Validacion metrica: Metrica de validacion (dias, semanas)"),
                SizedBox(height: 20),
                Text("Colchon: Tiempo de sobra que se puede tener para la entrega del producto al cliente, con la intencion de no quedar mal con el cliente"),
                SizedBox(height: 20),
                Text("Colchon metrica: Metrica de colchon (horas, dias)"),
              ]
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK",)),
        ],
    );
  }
}