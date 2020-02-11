import 'package:flutter/material.dart';

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  final _currencies = ['Dollars', 'Euro', 'Pounds', 'Naira'];
  String _currency = 'Dollars';

  // TextEditingController works the way as onchanged event listener method.
  TextEditingController distanceController = TextEditingController();

    String result = '';


  @override
  Widget build(BuildContext context) {
      TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
    appBar: AppBar(
      title: Text("Hello"),
      backgroundColor: Colors.blueAccent,
    ),
    body: Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          TextField(
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
          DropdownButton<String>(
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
            RaisedButton(
              color: Theme.of(context).primaryColorDark,
              textColor: Theme.of(context).primaryColorLight,
              onPressed: () {
                setState(() {
                  result = distanceController.text;
                });
              },
              child: Text(
                'Submit',
                textScaleFactor: 1.5,
              ),
            ),
          Text(result),
        ],
      )
    )
  );
  }
  _onDropdownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }
}
