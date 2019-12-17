import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Item> fetchItems() async {
  final String API_URL = 'https://5cbe1ec6ecded20014c20e48.mockapi.io';
  final response = await http.get('${API_URL}/dashboard');

  print(response.body);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Item.hi(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Item {
  final int allPointsAmount;
  final int availablePointsAmount;
  final int usedPointsAmount;
  final List<Map<String, dynamic>> usedPoints;

  Item({this.allPointsAmount, this.availablePointsAmount, this.usedPointsAmount, this.usedPoints});

  factory Item.hi(Map<String, dynamic> json) {
    return Item(
      allPointsAmount: json['allPointsAmount'],
      availablePointsAmount: json['availablePointsAmount'],
      usedPointsAmount: json['usedPointsAmount'],
      usedPoints: json['usedPoints'],
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<Item> items;

  @override
  void initState() {
    super.initState();
    items = fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

