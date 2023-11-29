// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CountProvider>(context, listen: false);
    print('Build ' + counterProvider.count.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  counterProvider.count.toString(),
                  style: TextStyle(
                    fontSize: 50,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
