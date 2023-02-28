// ignore: depend_on_referenced_packages
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newfront/mscren/prejornypage.dart';
import 'package:newfront/mscren/seatpage.dart';
import 'package:newfront/mscren/specialpage.dart';
import 'package:newfront/mscren/srchpage.dart';
import 'package:newfront/mscren/ticketpage.dart';

// ignore: camel_case_types
class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => mainpageWidget();
}

// ignore: camel_case_types
class mainpageWidget extends State<mainpage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const  Text(
              ' use interface ',
              // ignore: prefer_const_constructors
              style: (TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black)),
            ),
            actions: [
              TextButton.icon(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => srchpage(),
                      )),
                  icon: const Icon(Icons.search),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.purpleAccent,
                  ),
                  label: Text('Ticket'.tr())),
              IconButton(
                  onPressed: () {},
                  color: Colors.black,
                  icon: const Icon(Icons.more_vert)),
            ],
            backgroundColor: Colors.white,
            bottom: TabBar(
                unselectedLabelColor: Colors.purpleAccent,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purpleAccent),
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.purpleAccent, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Ticket'.tr()),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.purpleAccent, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('PreJourney'.tr()),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.purpleAccent, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Special'.tr()),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            ticketpage(),
            prejornypage(),
            specialpage(),
          ]),
        ));
  }
}
