import 'package:bloc_pattern_counter_app/pages/page_two.dart';
import 'package:flutter/material.dart';


class PageOne extends StatefulWidget {



  PageOne({Key key}) : super(key : key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {


  Color _color;

  @override
  void initState() {
    _color = _list[0].color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Page One'),),
      body: Container(
        height: h,
        width: double.infinity,
        color: _color,
        child: Center(
          child: FlatButton(onPressed: _onPressed, child: Text('Next Page')),
        )
      ),
    );
  }


  void _onPressed() async {
    final results = await  Navigator.push(context, MaterialPageRoute(builder: (c) {
      return PageTwo(colorList: _list);
    }));

    if (results != null && results.containsKey('color')) {
      setState(() {
        _color = results['color'];
      });
    }

  }
}



class ColorName {
  String colorName;
  Color color;

  ColorName({this.colorName, this.color});

}

List<ColorName> _list = [
  ColorName(colorName : "Yellow", color :Colors.yellow),
  ColorName(colorName :"Blue", color :  Colors.blue),
  ColorName(colorName :"Red", color : Colors.red),
  ColorName(colorName :"Green", color : Colors.green),
  ColorName(colorName :"Purple", color : Colors.purple),
  ColorName(colorName :"Oragne", color : Colors.orange),
  ColorName(colorName :"Black", color : Colors.black),

];


