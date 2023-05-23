import 'package:flutter/material.dart';
class onchange extends StatefulWidget {
  const onchange({super.key});

  @override
  State<onchange> createState() => _onchangeState();
}

class _onchangeState extends State<onchange> {

  bool b = false;

  void fn (value){
    setState(() {
      b = value;
      print(b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 15),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text('Agroo width Torm & Conditions', style: TextStyle(color: Colors.blue.shade400),),
        value: b,
         onChanged: fn),
    );
  }
}