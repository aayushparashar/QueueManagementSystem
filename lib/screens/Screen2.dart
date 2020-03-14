import 'package:flutter/material.dart';
import 'package:uneva_hiring_test/api1.dart';
import 'package:uneva_hiring_test/api2.dart';

class SecondScreen extends StatefulWidget {
  final id;

  SecondScreen(this.id);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondState();
  }
}

class _SecondState extends State<SecondScreen> {
  var _selected;

  Widget buildRow(String title, String index) {
    //Widget to build a row in the table

    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
            child: Text(title),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.3),
        Expanded(
          child: Container(
            child: Text('${_selected[index]}'),
            alignment: Alignment.centerLeft,
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    for (int i = 0; i < details_2.length; i++) {
      if (details_2[i]['_pk'] == widget.id) {
        _selected = details_2[i];
        break;
      }
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: _selected == null
            ? Text('Details Not Found')
            : Text(
                _selected['person_full_name'],
                style: TextStyle(fontSize: 15),
              ),
        actions: <Widget>[
          IconButton(
            //Edit button at the App BAr
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: _selected == null
          ? Center(
              child: Text('Person Not Found'),
            )
          : Column(
              children: <Widget>[
                Center(
                    child: Container(
                  height: 150,
                  child: Image.network(_selected['person_pic'], fit: BoxFit.cover,),
                )),
                SizedBox(
                  height: 20,
                ),
                buildRow('PID', '_pk'),
                buildRow('Name', 'person_full_name'),
                buildRow('Gender', 'person_gender'),
                buildRow('Age', 'person_age'),
                buildRow('Phone', 'person_phone'),
                buildRow('S/O', 'person_relation'),
                buildRow('Address', 'person_address')
              ],
            ),
    );
  }
}
