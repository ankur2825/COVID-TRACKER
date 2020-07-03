import 'package:flutter/foundation.dart';
import 'detailpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<User>> getUsers() async {
    var data = await http.get("https://api.covid19india.org/data.json");
    List jsonData = json.decode(data.body)['statewise'];
    return jsonData.map((user) => User.fromJson(user)).toList();
  }

  double ele = 5.0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "STATES & UNION TERRITORIES",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Align(
                  alignment: Alignment.center,
                  child: LinearProgressIndicator(backgroundColor: Color(0xffFE0139)),
                );
              } else {
                return ListView.separated(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    User user = snapshot.data[index];
                    return GestureDetector(
                      onTap: () {
                        ele = 0;
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => DetailPage(user),
                          ),
                        );
                      },
                      child: Container(
                        height: 60.0,
                          child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          color: Color(0xffEDEEEF),
                          shadowColor: Colors.black,
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 7.5),
                              CircleAvatar(
                                radius: 27.5,
                                backgroundImage: NetworkImage(
                                    "https://yt3.ggpht.com/a/AGF-l79wR7KlO-jipzMsRdMZgs2DDhsjsfsdhKAPxw=s900-c-k-c0xffffffff-no-rj-mo"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                user.state,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff000000), fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                );
              }
            },
          ),
        ),
    );
  }
}

class User {
  final String statecode;
  final String active;
  final String confirmed;
  final String deaths;
  final String recovered;
  final String state;

  User(
      {this.statecode,
      this.active,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.state});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      statecode: json['statecode'],
      active: json['active'],
      confirmed: json['confirmed'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      state: json['state'],
    );
  }
}
