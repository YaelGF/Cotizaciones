import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, dynamic> formData = {
      'rent':               0,
      'light':              360,
      'profits':            2,
      'hours_print':        18,
      'days_print':         5,
      'error_margin':       30,
      'filament_margin':    950,
      'wear_print':         180,
      'wear_cost':          500,
      'validation':         5,
      'validation_metric':  'days',
      'mattress':           2,
      'mattress_metric':    'days',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        actions: [
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const ShowDialogHelpWidget(),
              );
            }, 
            icon: const Icon(Icons.help)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children:  [
                CustomRowWidget (
                  customIputFieldLeft: CustomIputField( labelText: "Renta de local", hintText: "Costo de renta", icon: Icons.house_sharp, formProperty: 'rent', formData: formData),
                  customIputFieldRight: CustomIputField( labelText: "Luz", hintText: "Luz del local", icon: Icons.lightbulb_outline, formProperty: 'light', formData: formData),
                ),
                const SizedBox(height: 20),
                CustomRowWidget(
                  customIputFieldLeft: CustomIputField(labelText: "Margen de ganacia", hintText: "Margen de ganancia", icon: Icons.money, formProperty: 'profits', formData: formData), 
                  customIputFieldRight: CustomIputField(labelText: "Horas impresion", hintText: "Horas del dia", icon: Icons.access_time, formProperty: 'hours_print', formData: formData),
                ),
                const SizedBox(height: 20),
                CustomRowWidget(
                  customIputFieldLeft: CustomIputField(labelText: "Dias de la semana", hintText: "Dias semanales", icon: Icons.calendar_today, formProperty: 'days_print', formData: formData), 
                  customIputFieldRight: CustomIputField(labelText: "Margen de error", hintText: "Margen de error",helperText: "en porcentaje %", icon: Icons.error, formProperty: 'error_margin', formData: formData),
                ),
                const SizedBox(height: 20),
                CustomIputField(labelText: "Margen filamento a usar", hintText: "Margen filamento",helperText: "en gramos ejemplo 950", icon: Icons.priority_high, formProperty: 'filament_margin', formData: formData),
                const SizedBox(height: 20),
                CustomRowWidget(
                  customIputFieldLeft: CustomIputField(labelText: "Desgaste impresora", hintText: "Desgaste impresora",helperText: "en dias", icon: Icons.priority_high, formProperty: 'wear_print', formData: formData),
                  customIputFieldRight: CustomIputField(labelText: "Costo desgaste", hintText: "Costo desgaste",helperText: "en pesos", icon: Icons.attach_money, formProperty: 'wear_cost', formData: formData),
                ),
                const SizedBox(height: 20),
                CustomRowWidget(
                  customIputFieldLeft: CustomIputField(labelText: "Validacion", hintText: "Tiempo",helperText: "en dias", icon: Icons.check, formProperty: 'validation', formData: formData),
                  customIputFieldRight: DropdownButtonFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.calendar_month),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Metrica",
                      hintText: "Seleccione una opcion",
                    ),
                    items: const[
                      DropdownMenuItem(value: "days", child: Text("Dias")),
                      DropdownMenuItem(value: "weeks", child: Text("Semanas")),
                    ], 
                    validator: (value) => value == null ? "Seleccione una opcion" : null,
                    onChanged: 
                      (value) {
                        formData['validation_metric'] = value.toString();
                      }
                  ),
                ),
                const SizedBox(height: 20),
                CustomRowWidget(
                  customIputFieldLeft: CustomIputField(labelText: "Colchon", hintText: "Tiempo colchon", icon: Icons.av_timer, formProperty: 'mattress', formData: formData),
                  customIputFieldRight: DropdownButtonFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.calendar_month),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Metrica",
                      hintText: "Seleccione una opcion",
                    ),
                    items: const[
                      DropdownMenuItem(value: "hours", child: Text("Horas")),
                      DropdownMenuItem(value: "days", child: Text("Dias")),
                    ], 
                    validator: (value) => value == null ? "Seleccione una opcion" : null,
                    onChanged: 
                      (value) {
                        formData['mattress_metric'] = value.toString();
                      }
                  )
                ),
                const SizedBox(height: 20),
                const Text("Nota: Si no entiende algun campo, revise la session de ayuda"),
                const SizedBox(height: 40),

                ElevatedButton(onPressed: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (!formKey.currentState!.validate()){
                    print("Formulario invalido");
                    return;
                  }
                  formKey.currentState!.save();
                  print(formData);
                }, 
                  child: const ButtonSaveWidget()
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

