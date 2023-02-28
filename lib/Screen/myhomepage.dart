// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newfront/mscren/tabcontroller.dart';
import '../mscren/mainpage.dart';

class myhomepage extends StatefulWidget {


  @override
  State<myhomepage> createState() => _myhomepagewidget();

  // State<StatefulWidget> createState() {
  //   return myhomepagewidget();
  // }
}

class _myhomepagewidget extends State<myhomepage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            padding: const EdgeInsets.only(top: 15),
            height: 80,
            width: width,
            decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child:  const Text(
              'The user interface',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
            flex: 7,
            child: Column(
              children: <Widget>[
                /////////////////////////
                ///

                Flexible(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Flexible(
                          child: Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    context.setLocale(
                                      const Locale("en", "US"),
                                    );
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => tabcontroller(),
                                      ));
                                },
                                child: const Text(
                                  'English',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          child: Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    context.setLocale(
                                      const Locale("am", "ET"),
                                    );
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => tabcontroller(),
                                      ));
                                },
                                child: const Text(
                                  'አማርኛ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          child: Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    context.setLocale(const Locale("de", "AT"));
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => tabcontroller(),
                                      ));
                                },
                                child: const Text(
                                  'Afaan Oromoo',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                /////////////////////////
              ],
            )),
        Flexible(
            child: Container(
          decoration: const BoxDecoration(
            color: Colors.purpleAccent,
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Copyright 2022-2023 © Aman Digital Bus. All Right Reserved',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ))
      ]),
    );
  }
}
