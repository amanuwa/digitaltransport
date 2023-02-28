// ignore_for_file: camel_case_types
import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newfront/mscren/mainpage.dart';
import 'package:http/http.dart' as http;

class srchpage extends StatefulWidget {
  @override
  State<srchpage> createState() => srchpageWidget();
}

class srchpageWidget extends State<srchpage> {
  //tktnumber

  final TextEditingController tktcontrol = TextEditingController();
  final TextEditingController tktnumber = TextEditingController();
  String tktnum1 = "";
  String name = "";
  String phone = "";
  String jornedata = "";

  String seatnum = "";

  String time = "";

  String car = "";

  String platenum = "";

  String sidenum = "";

  String drivernum = "";

  String assisnum = "";

  String price = "";
  var tktlist = [];
  var tktlist1 = [];
  returntktdata() async {
    print('gebtnal');
    try {
      Map<String, dynamic> map = {"tktnum": tktnumber.text.toString().trim()};

      var body = json.encode(map);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};
      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/rtrntktnum'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = await json.decode(response.body);
      var units = (json.decode(response.body) as Map<String, dynamic>);

      print(units);
      setState(() {
        tktlist = units["data"].toList();
        tktlist1 = tktlist[0];

        print(tktlist1);

        tktnum1 = tktlist1[1].toString();
        name = tktlist1[2].toString();
        phone = tktlist1[3].toString();
        jornedata = tktlist1[4].toString();

        seatnum = tktlist1[5].toString();

        time = tktlist1[6].toString();

        car = tktlist1[7].toString();

        platenum = tktlist1[8].toString();

        sidenum = tktlist1[9].toString();

        drivernum = tktlist1[10].toString();

        assisnum = tktlist1[11].toString();

        price = tktlist1[12].toString();
      });

      tktcontrol.text = (('ticket number :  ') +
          (tktnum1) +
          ('\n') +
          ('Name:  ') +
          (name) +
          ('\n') +
          ('phone:  ') +
          (phone) +
          ('\n') +
          ('jornedata:  ') +
          (jornedata) +
          ('\n') +
          ('Time :  ') +
          (time) +
          ('\n') +
          ('seatnum :  ') +
          (seatnum) +
          ('\n') +
          ('car :  ') +
          (car) +
          ('\n') +
          ('platnum :  ') +
          (platenum) +
          ('\n') +
          ('sidenum :  ') +
          (sidenum) +
          ('\n') +
          ('drivernum :  ') +
          (drivernum) +
          ('\n') +
          ('assisnum :  ') +
          (assisnum) +
          ('\n') +
          ('price :  ') +
          (price) +
          ('\n'));
    } on HttpException {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  color: const Color.fromARGB(255, 209, 203, 203),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        top: 0,
                        bottom: 0,
                        child: IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const mainpage(),
                                )),
                            icon: const Icon(Icons.arrow_back_sharp)),
                      ),
                      Positioned(
                          left: 40,
                          right: 100,
                          bottom: 0,
                          top: 10,
                          child: Container(
                              color: Colors.white,
                              //height: 150,
                              margin: const EdgeInsets.fromLTRB(5, 0, 1, 9),
                              child: TextFormField(
                                controller: tktnumber,
                                //  expands: true,
                                decoration: const InputDecoration(
                                  //prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(),
                                  hintText:
                                      ('your ticket number/  your phone number'),
                                  suffixIcon: Icon(Icons.search),
                                ),
                              ))),
                      Positioned(
                          child: Container(
                        height: 50,
                        //  color: Colors.amberAccent,
                        margin: const EdgeInsets.fromLTRB(2, 20, 8, 0),
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            onPressed: () {
                              returntktdata();
                            },
                            // ignore: sort_child_properties_last
                            child: const Text('search'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purpleAccent)),
                      )),
                    ],
                  ))),
          Flexible(
              child: Row(
            children: [
              Flexible(
                  child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('print'),
                    icon: const Icon(Icons.print),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent)),
              ))
            ],
          )),
          Flexible(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Flexible(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: TextFormField(
                        controller: tktcontrol,
                        readOnly: true,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      )))
            ],
          ))
        ],
      ),
    );
  }
}
