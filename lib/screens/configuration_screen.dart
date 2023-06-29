import 'package:flutter/material.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 200),
              InputDatePickerFormField(firstDate: DateTime(2017,9,7,17,30), lastDate: DateTime(2019,9,7,17,10))
            ],
          ),
        )
      ),
    );
  }
}