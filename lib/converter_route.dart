// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);
const _inputColor = Colors.grey;

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// This [Category]'s name.
  final String name;

  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units
  var _inputQuantity;
  String _inputUnit = null;
  // TODO: Determine whether you need to override anything, such as initState()

  // TODO: Add other helper functions. We've given you one, _format()

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that
    // includes the input value, and 'from' unit [Dropdown].

    final _input = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            cursorColor: _inputColor,
            style: TextStyle(fontSize: 22.0),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: _inputColor)),
              labelText: 'Input',
              labelStyle: TextStyle(color: _inputColor, fontSize: 22.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _inputColor)),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        DropdownButton(
          items: <String>['A', 'B', 'C'].map((String value) {
            return new DropdownMenuItem<String>(
              value: _inputUnit,
              child: new Text(value),
            );
          }).toList(),
          hint: Text('Select unit'),
          onChanged: (value) {
            this.setState(() {
              _inputUnit = value;
            });
          },
        )
      ],
    );
    // TODO: Create a compare arrows icon.

    // TODO: Create the 'output' group of widgets. This is a Column that
    // includes the output value, and 'to' unit [Dropdown].

    // TODO: Return the input, arrows, and output widgets, wrapped in a Column.

    final _unitWidgets = Column(
      children: <Widget>[_input],
    );

    // TODO: Delete the below placeholder code.
    // final unitWidgets = widget.units.map((Unit unit) {
    //   return Container(
    //     color: widget.color,
    //     margin: EdgeInsets.all(8.0),
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       children: <Widget>[
    //         Text(
    //           unit.name,
    //           style: Theme.of(context).textTheme.headline,
    //         ),
    //         Text(
    //           'Conversion: ${unit.conversion}',
    //           style: Theme.of(context).textTheme.subhead,
    //         ),
    //       ],
    //     ),
    //   );
    // }).toList();

    return Material(
      child: _unitWidgets,
    );
  }
}
