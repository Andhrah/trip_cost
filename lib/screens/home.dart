import 'package:flutter/material.dart';

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  final _currencies = ['Dollars', 'Euro', 'Pounds', 'Naira'];

  final double _formDistance = 5.0;
  String _currency = 'Dollars';

  // TextEditingController works the way as onchanged event listener method.
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

    String result = '';


  @override
  Widget build(BuildContext context) {
      TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
    appBar: AppBar(
      title: Text("Trip Cost Calculator"),
      backgroundColor: Colors.blueAccent,
    ),
    body: Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: _formDistance, 
            bottom: _formDistance
            ),
            child: TextField(
              controller: distanceController,
              decoration: InputDecoration(
                labelText: 'Distance',
                hintText: 'e.g. 123',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              ),
              keyboardType: TextInputType.number,
              // onChanged: (String string) {
              //   setState(() {
              //     name = string;
              //   });
              // },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _formDistance, 
            bottom: _formDistance
            ),
            child:TextField(
              controller: avgController,
              decoration: InputDecoration(
                labelText: 'Distance per Unit',
                hintText: 'e.g. 17',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              ),
              keyboardType: TextInputType.number,
              // onChanged: (String string) {
              //   setState(() {
              //     name = string;
              //   });
              // },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _formDistance, 
            bottom: _formDistance
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      hintText: 'e.g. 1.65',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    keyboardType: TextInputType.number,
                    // onChanged: (String string) {
                    //   setState(() {
                    //     name = string;
                    //   });
                    // },
                  ),
                ),
                Container(width: _formDistance * 5),
                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((String value){
                      return DropdownMenuItem<String> (
                        value: value,
                        child: Text(value)
                      );
                    }).toList(),
                    value: _currency,
                    onChanged: (String value) {
                      _onDropdownChanged(value);
                    },
                  ),
                )
            ],)
          ),
            
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    setState(() {
                      result = _calculate();
                    });
                  },
                  child: Text(
                    'Submit',
                    textScaleFactor: 1.5,
                  ),
                ),
              ),

              Expanded(
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                  child: Text(
                    'Reset',
                    textScaleFactor: 1.5,
                  ),
                ),
              ),
            ],
          ),
          Text(result),
        ],
      )
    )
  );
  }

  void _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;
    String _result = 'The total cost of your trip is ' + _totalCost.toStringAsFixed(2) + ' ' + _currency;
    return _result;
  }

  void _reset() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }
}
