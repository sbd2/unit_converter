// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/unit.dart';

// TODO: Check if we need to import anything

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _icon = Icons.cake;

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.

    // TODO: Create a list view of the Categories
    final listView = Container(
        color: Colors.green[100],
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: _categoryNames.length,
          itemBuilder: (context, index) {
            return Category(
              name: _categoryNames[index],
              color: _baseColors[index],
              iconLocation: _icon,
              units: <Unit>[
                Unit(name: 'Meter', conversion: 1.0),
                Unit(name: 'Centimeter', conversion: 100.0)
              ],
            );
          },
        ));

    // TODO: Create an App Bar
    final appBar = AppBar(
      title: Text('Unit Converter',
          style: TextStyle(color: Colors.black, fontSize: 30.0)),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.green[100],
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
