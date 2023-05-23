import 'package:flutter/material.dart';

class boshqasahifa extends StatelessWidget {
  const boshqasahifa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yangi Saxifa'),),
      body: Column(
        children: [
          Expanded(child: Container(
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
            child: const Center(child: Text('Yangi Oyna', 
            style: TextStyle(color: Colors.white, 
            fontSize: 30, 
            fontWeight: FontWeight.bold,
            ),
            ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}