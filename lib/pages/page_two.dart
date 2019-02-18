import 'package:bloc_pattern_counter_app/pages/page_one.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  List<ColorName> colorList;

  PageTwo({Key key, this.colorList}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page Two'),


        ),
        body: ListView.builder(
            itemCount: widget.colorList.length,
            itemBuilder: (context, i) {


              ColorName _c = widget.colorList[i];
              String name = widget.colorList[i].colorName;
              return ListTile(
                  onTap: () => _onTapTile(_c),
                  title : Text(name));
            }));
  }

  void _onTapTile(ColorName _c){
    Navigator.of(context).pop({'color': _c.color});
  }
}
