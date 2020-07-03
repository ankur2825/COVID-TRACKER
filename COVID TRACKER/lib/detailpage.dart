import 'dart:ui';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';

class DetailPage extends StatelessWidget {
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          user.state,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xffEEEEEE)),
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 100),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xffFF043A)),
                            color: Color(0xffFFE5E7),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20),
                              Text(
                                'CONFIRMED : ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xffFF7681),
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                user.confirmed,
                                style: TextStyle(
                                  color: Color(0xffFF043A),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(right: 100),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xff2391FF)),
                          color: Color(0xffEFF7FF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                            children: <Widget>[
                              SizedBox(width: 20),
                              Text(
                                'ACTIVE : ',
                                style: TextStyle(
                                  color: Color(0xff5CAFFF),
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                user.active,
                                style: TextStyle(
                                  color: Color(0xff2391FF),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 100),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffE7F4E8),
                          border:
                              Border.all(width: 1, color: Color(0xff28A745)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                            children: <Widget>[
                              SizedBox(width: 20),
                              Text('RECOVERED : ',
                                  style: TextStyle(
                                      color: Color(0xff83C88C), fontSize: 20)),
                              Text(
                                user.recovered,
                                style: TextStyle(
                                  color: Color(0xff28A745),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 100),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffF6F6F7),
                          border:
                              Border.all(width: 1, color: Color(0xff6C757C)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                            children: <Widget>[
                              SizedBox(width: 20),
                              Text('DEATHS : ',
                                  style: TextStyle(
                                      color: Color(0xffA3AAB0), fontSize: 20)),
                              Text(
                                user.deaths,
                                style: TextStyle(
                                  color: Color(0xff6C757C),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        
      ),
    );
  }
}
