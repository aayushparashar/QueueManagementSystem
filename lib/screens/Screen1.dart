import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uneva_hiring_test/api1.dart';
import 'package:intl/intl.dart';
import 'package:uneva_hiring_test/screens/Screen2.dart';

class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScreenState();
  }
}

class _ScreenState extends State<Screen1> {
  List<Map<String, Object>> _currList = details;
  int waiting = 0,
      completed = 0,
      total = 0;

  void sort() {
    //Function to Sort Incoming list on the basis of Token Nmbers
    _currList.sort((cust1, cust2) =>
        (cust1['tokenName'] as String).compareTo(cust2['tokenName']));
  }

  @override
  void initState() {
    sort();
    for (int i = 0; i < _currList.length; i++) {
      if (_currList[i]['status'] == 0) {
        waiting++;
      } else {
        completed++;
      }
    }
    total = _currList.length;
    // TODO: implement initState
    super.initState();
  }

  final appbar = AppBar(
    title: Text(
      'ECHO-ALL',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var StatusBar = Padding(
      //Widget to Show the Status Bar
        padding: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Waiting: $waiting'),
            Text('Completed: $completed'),
            Text('Total: $total')
          ],
        ));


    // TODO: implement build
    return Scaffold(
      appBar: appbar,
      body: ListView(
        //Overrall Layout
        children: <Widget>[
          StatusBar,
          Container(
            //Container which sets a limit on the height of the ListView Builder
              padding: EdgeInsets.only(top: 10),
              height: (MediaQuery
                  .of(context)
                  .size
                  .height -
                  appbar.preferredSize.height -
                  MediaQuery
                      .of(context)
                      .padding
                      .top) *
                  0.95,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(children: [
                    InkWell(
                        onTap: () {
                          Map<String, Object> map = _currList[index]['other'];
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return SecondScreen(map['pid']);
                          }));
                        },
                        child: ListTile(
                          leading: Text(
                            _currList[index]['tokenName'],
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                            ),
                          ),
                          title: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _currList[index]['name'],
                                ),
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    _currList[index]['description'],
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )),
                              Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    DateFormat("dd-MMM").add_jm().format(
                                        DateTime(
                                            _currList[index]['timestamp'])),
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )),
                            ],
                          ),
                          trailing: Column(
                            children: <Widget>[
                              Icon(
                                Icons.more_vert,
                                size: 30,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: _currList[index]['status'] == 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ],
                          ),
                        )),
                    Divider()
                  ]);
                },
                itemCount: details.length,
              ))
        ],
      ),
    );
  }
}
