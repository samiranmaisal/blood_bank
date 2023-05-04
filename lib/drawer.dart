import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  drawer(this.currentPage);

  final String currentPage;


  @override
  _drawer createState() => new _drawer(currentPage);
}

class _drawer extends State<drawer> {
  _drawer(this.currentPage);
  String currentPage;
  String full_name = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        children: <Widget>[
          Container(

            color: Colors.blue[300],
            height: 80.0,

            child:  ListView(
              children: <Widget>[
                Container(height: 20,),

                Text("Blood Bank", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.yellow[200],), textAlign: TextAlign.center,),
              ],
            ),
          ),
          setview(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }

  Widget setview() {
    return Visibility(
      //visible: false, //Default is true,
        child: new Container(

          child: new Column(
            children: <Widget>[

              ListTile(
                title: Text(
                  "Search",
                  style: new TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'OpenSans-Regular',
                      color: const Color(0xff0A2A55)),
                ),
                trailing:
                Icon(Icons.search, color: const Color(0xff0A2A55)),
                onTap: () {

                  //Navigator.of(context).push(MaterialPageRoute(
                  //builder: (BuildContext context) =>      profile()));
                },
              ),

              Divider(height: 0),
            ],

          ),

        )
    );
  }
}