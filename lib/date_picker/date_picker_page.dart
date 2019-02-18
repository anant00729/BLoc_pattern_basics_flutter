import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickerPage extends StatefulWidget {
  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {

  DateTime _dateTime;
  DateTime _dateTimeNow;

  DateTime pick;


  @override
  void initState() {
    _dateTime = DateTime(1950,1,1);
    _dateTimeNow = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Text('Display Date Here'),
            FlatButton(child: Text(
                pick == null ?  'Select Some Date' : '${DateFormat.yMd().format(pick)}') ,
                onPressed: _onPressed)
          ],
        ),
      ),
    );
  }


  void _onPressed() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dateTimeNow,
      firstDate: _dateTime,
      lastDate: _dateTimeNow,
    );



    setState(() {
      this.pick = picked;
    });
  }
}
