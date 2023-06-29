
import 'package:flutter/material.dart';

class ButtonSaveWidget extends StatelessWidget {
  const ButtonSaveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.save),
          SizedBox(width: 10),
          Text("Guardar", style: TextStyle(fontSize: 20))
        ],
      )
    );
  }
}