// ignore_for_file: unused_import, camel_case_types, avoid_unnecessary_containers, dead_code, duplicate_ignore
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newfront/mscren/mainpage.dart';
import 'package:newfront/mscren/ticketpage.dart';

class specialpage extends StatefulWidget {
 

  @override
  State<StatefulWidget> createState() {
    return specialpagewidget();
  }
}

class specialpagewidget extends State {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      double width = MediaQuery.of(context).size.width;
      return Scaffold(
        body: Container(),
      );
    });
  }
}
