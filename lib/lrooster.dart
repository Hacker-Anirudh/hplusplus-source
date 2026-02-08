import 'package:flutter/material.dart';
import 'package:hplusplus/db.dart';
import 'package:hplusplus/common.dart';

class LRScreen extends StatefulWidget {
  const LRScreen({super.key});

  @override
  State<LRScreen> createState() => _LRScreenState();
}

class _LRScreenState extends State<LRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        'https://cors-anywhere.com/https://llnroosters.hhscholen.be/klassen/ed${classMap[klas]}p00001s3fffffffffffffff_${klas.toLowerCase()}_vs.png',
      ),
    );
  }
}
