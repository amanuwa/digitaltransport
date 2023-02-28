// ignore: depend_on_referenced_packages
// ignore_for_file: depend_on_referenced_packages, duplicate_ignore, camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, empty_catches, unused_local_variable, avoid_function_literals_in_foreach_calls, avoid_init_to_null, prefer_const_constructors, unnecessary_const, sort_child_properties_last, unused_label, prefer_interpolation_to_compose_strings

import 'dart:html';
import 'dart:js_util';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newfront/mscren/seatpage.dart';

import 'dart:convert';
import 'dart:io';
import 'dart:math';

class ticketpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ticketpagewidget();
  }
}

class ticketpagewidget extends State {

  final String Amanj = "qwerty";
  final String bus1 = "poiuyt";
  final String name = "qwerty";
  final String phone = "poiuyt";

  DateTime dat = DateTime.now();
  String fynaldat = "";
  final TextEditingController journydata = TextEditingController();
  final TextEditingController nam = TextEditingController();
  final TextEditingController fon = TextEditingController();
  ScrollController Amanscrol = ScrollController();
  static final curdat = DateTime.now();

  static final today = DateTime(curdat.day, curdat.month, curdat.year);

  static String td = DateFormat('EEEE').format(curdat);

  static final today1 = DateTime(curdat.year, curdat.month, curdat.day + 1);

  static String td1 = DateFormat('EEEE').format(today1);

  static final today2 = DateTime(curdat.year, curdat.month, curdat.day + 2);

  static String td2 = DateFormat('EEEE').format(today2);

  static final today3 = DateTime(curdat.year, curdat.month, curdat.day + 3);

  static String td3 = DateFormat('EEEE').format(today3);

  static final today4 = DateTime(curdat.year, curdat.month, curdat.day + 4);

  static String td4 = DateFormat('EEEE').format(today4);

  static final today5 = DateTime(curdat.year, curdat.month, curdat.day + 5);

  static String td5 = DateFormat('EEEE').format(today5);

  static final today6 = DateTime(curdat.year, curdat.month, curdat.day + 6);

  static String td6 = DateFormat('EEEE').format(today6);

  static final today7 = DateTime(curdat.year, curdat.month, curdat.day + 7);

  static String td7 = DateFormat('EEEE').format(today7);

  static final today8 = DateTime(curdat.year, curdat.month, curdat.day + 8);

  static String td8 = DateFormat('EEEE , MMMM d').format(today8);

  static final today9 = DateTime(curdat.year, curdat.month, curdat.day + 9);

  static String td9 = DateFormat('EEEE , MMMM d').format(today9);
  static final today10 = DateTime(curdat.year, curdat.month, curdat.day + 10);

  static String td10 = DateFormat('EEEE , MMMM d').format(today10);
  static final today11 = DateTime(curdat.year, curdat.month, curdat.day + 11);

  static String td11 = DateFormat('EEEE , MMMM d').format(today11);
  static final today12 = DateTime(curdat.year, curdat.month, curdat.day + 12);

  static String td12 = DateFormat('EEEE , MMMM d').format(today12);

  List<String> dys = [
    'Today',
    'Tommorow',
    td2,
    td3,
    td4,
    td5,
    td6,
    td7,
    td8,
    td9,
    td10,
    td11,
    td12
  ];
  static final List<String> tym = [
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '01:00',
    '01:30'
  ];
  var jornylist2 = [];
  var jornylist = [];
  var jornylist9 = [];
  var Selectedtym;

  static var isEnabled1 = false;
  static var isEnabled2 = false;
  static var isEnabled3 = false;
  static var isEnabled4 = false;
  static var isEnabled5 = false;
  static var isEnabled6 = false;
  static var isEnabled7 = false;
  static var isEnabled8 = false;
  static var isEnabled9 = false;
  static var isEnabled10 = false;
  var blist = [
    isEnabled1,
    isEnabled2,
    isEnabled3,
    isEnabled4,
    isEnabled5,
    isEnabled6,
    isEnabled7,
    isEnabled8,
    isEnabled9,
    isEnabled10
  ];
  String Aman = "poiuy";
  String contre = "poiuy";
  Alljourney() async {
    try {

      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/Alljourney'),
        body: {"Journey": "diredewa", "general_id": "00", "journey_id": "67"},
      );

      var units = (json.decode(response.body) as Map<String, dynamic>);

      setState(() {
        jornylist = units["data"].toList();
    
for(var l=0;l<jornylist.length ;l++)
{

 setState(() {
   if((jornylist[l]=="jimma"))
 {
  print('hi');
  print('getit');
  // contre=jornylist[l];
  // contre.tr();
 jornylist[l]= 'jimma'.tr();

  }
 });
}


// jornylist.forEach((element) {
//   print(element);
//   if(element=="AddisAbaba")
//   { }
//  });

        jornylist2 = jornylist;
        jornylist9 = jornylist;
        jon = jornylist;

   
      });
    } on HttpException {}
  }

  var basiclist = [];
  var carlist = [];
  static var rr = [];
 bool cont = false;
  var carprice = "";
  String car1 = "bus1";
  String car2 = "bus2";
  var linear1 = [];
  var linear;
  var availablesat = 0;

  basicdata() async {
    try {
      Map<String, dynamic> map9 = {
        "jornedata": fynaldat.toString().trim(),
      };

      var body = json.encode(map9);
      print(body);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/carstat'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);
      
      var units = (json.decode(response.body) as Map<String, dynamic>);


     
     

         print('this is  basic data');
            print('units');
               print('units');

              

  
      setState(() {
        basiclist = units["data"].toList();

        print(basiclist);
         basiclist.forEach((element) {
         // print('${element['carstatus']}');
        rr.add('${element['carstatus']}');
         // print(rr);

          
        });
        rr.length = basiclist.length;
        carlist = rr;
         print(carlist);
        
        // print(basiclist.length);

        // if((basiclist.length)==2)
        // {
        //    linear1 = basiclist[0][9];
        // print(linear1);

        // linear = linear1.expand((i) => i).toList();
        // print(linear);

        // availablesat = subtract((52), (linear.length));
        // print(availablesat);
        // }
        
        
//  for (var e = 0; e < basiclist.length; e++) {
//                               for (var p = 0; p < basiclist.length; p++) {
//                                 blist[p] = true;
//                               }
//                             }
  
        if (true) {
           print('carfound ');
         setState(() {
          cont = true;
         });
          print('hi me ');
        } else {
          cont = false;
        }
      });



    } on HttpException {}


  }
   

  var jon = [];
  var setnumcol = [];

 

  setnumbercol() async {
    print('gebtnal');
    try {
      Map<String, dynamic> map = {
        "car": car1,
        "jornedata": fynaldat.toString().trim(),
      };

      var body = json.encode(map);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};
      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/setnum'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);

      print(data);

      setState(() {
        // print('object');
        // setnumcol = data["data"].toList();
        // linear1 = setnumcol[0];
        // print(linear1);

        // linear = linear1.expand((i) => i).toList();

        // availablesat = subtract((52), (linear.length));

        // print(availablesat);
      });
    } on HttpException {}
  }

  @override
  void initState() {
    super.initState();
    Alljourney();
   
  }

  var selecteddate = null;

  String? dropdownvalue;
  String? Startingposition;
  String? dropdownvalue1;
  String Selekteddate = " ";
  String mn = " ";
  var m = 0;
  var n = 0;
  int current = 100;
  String stod = " ";
  void check(value) {
    //print("index udefined $value");
    var temp = jornylist9
        .where((x) => jornylist9.indexOf(x) != jornylist9.indexOf(value))
        .toList();

    setState(() {
      jornylist2 = temp;
    });
  }

  void check1(value) {
    // print("index udefined 2 $value");
    var temp = jornylist9
        .where((x) => jornylist9.indexOf(x) != jornylist9.indexOf(value))
        .toList();

    setState(() {
      jornylist = temp;
    });
  }

  @override
  Widget build(BuildContext context) {


    
    return LayoutBuilder(builder: (builder, constraints) {
      double width = MediaQuery.of(context).size.width;

      double height = MediaQuery.of(context).size.height;
      return Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: ListView(children: <Widget>[
            Expanded(
              child: LayoutBuilder(builder: (context, Constraints) {
                return Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 45,
                      width: width * 0.4,
                      color: Colors.white,
                      child: TextFormField(
                        controller: nam,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Name'.tr()),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: width * 0.4,
                        margin: EdgeInsets.only(left: 8),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('PostpondandRefund'.tr()),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                        ),
                      ),
                    )
                  ],
                );
              }),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      height: 45,
                      width: width * 0.4,
                      color: Colors.white,
                      child: TextFormField(
                        controller: fon,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            border: OutlineInputBorder(),
                            hintText: 'phone'.tr()),
                      ),
                    ),
                  ],
                );
              }),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(2, 5, 10, 2),
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          items: jornylist
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          hint: Text('Starting'.tr()),
                          value: dropdownvalue,
                          onChanged: (value) {
                            setState(() {
                              dropdownvalue = value.toString();
                              Startingposition = dropdownvalue.toString();

                              check(value.toString());
                            });
                            validator:
                            (value) => value == null ? 'field required' : null;
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.05,
                      margin: EdgeInsets.fromLTRB(2, 5, 0, 2),
                      child: Text(
                        'to'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 5, 2),
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          items: jornylist2
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          hint: Text('destination'.tr()),
                          value: dropdownvalue1,
                          onChanged: (value) {
                            setState(() {
                              dropdownvalue1 = value.toString();

                             

                              check1(value.toString());
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  children: <Widget>[
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(1, 5, 10, 2),
                    //   child: ElevatedButton.icon(
                    //     onPressed: () async {
                    //       DateTime? newDate = await showDatePicker(
                    //         context: context,
                    //         initialDate: dat,
                    //         firstDate: DateTime(2022),
                    //         lastDate: DateTime(2032),
                    //       );
                    //       if (newDate == null) return;
                    //       setState(() => dat = newDate);
                    //     },
                    //     label: const Text("Pick date"),
                    //     icon: Icon(Icons.date_range),
                    //     style: ElevatedButton.styleFrom(
                    //         backgroundColor: Color.fromARGB(255, 174, 166, 175)),
                    //   ),
                    // ),

                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 5,
                    ),

                    Flexible(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 2),
                        //  width: double.infinity
                        width: width * 0.95,
                        color: Color.fromRGBO(0, 0, 0, 0.122),
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: dys.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selecteddate = dys[index].toString();
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  margin: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                  width: 79,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: current == index
                                          ? Colors.white
                                          : Colors.white54,
                                      borderRadius: current == index
                                          ? BorderRadius.circular(15)
                                          : BorderRadius.circular(10),
                                      // BorderRadius.circular(10),
                                      border: current == index
                                          ? Border.all(
                                              color: Colors.purpleAccent,
                                              width: 3)
                                          : null),
                                  duration: const Duration(milliseconds: 300),
                                  child: Center(
                                    child: Text(dys[index]),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),

            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: <Widget>[
                    Positioned(
                      left: 5,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.fromLTRB(0, 10, 2, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.purpleAccent, width: 2),
                        ),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                          items: tym
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          hint: Text('time'.tr()),
                          value: Selectedtym,
                          onChanged: (value) {
                            setState(() {
                              Selectedtym = value.toString();
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.black,
                          ),
                        )),
                      ),
                    ),
                    Positioned(
                      left: 70,
                      right: 90,
                      bottom: 0,
                      top: 10,
                      child: Container(
                        //     color: Colors.white,
                        //     //height: 150,
                        margin: EdgeInsets.fromLTRB(5, 5, 1, 15),
                        //     child: TextFormField(
                        //       //  expands: true,
                        //       decoration: InputDecoration(
                        //         //prefixIcon: Icon(Icons.search),
                        //         border: OutlineInputBorder(),
                        //         hintText: ('your ticket number'),
                        //         suffixIcon: Icon(Icons.search),
                        //       ),
                        //     )),
                        //  width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.white,
                        ),
                        // margin: EdgeInsets.fromLTRB(3, 10, 3, 2),
                        child: TextField(
                          controller: journydata,
                          readOnly: true,
                          decoration: InputDecoration(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Flexible(
                        child: Container(
                      //  width: 100,
                      height: 50,
                      //  color: Colors.amberAccent,
                      margin: EdgeInsets.fromLTRB(2, 20, 8, 0),
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: () async {
                          Writedata();

                          print('Writedata finished');
                            // setnumbercol();
                                print('setnumbercol finished');
                          basicdata() ;
                            print('basicdata finished');
                            for (var e = 0; e < carlist.length; e++) {
                              for (var p = 0; p < carlist.length; p++) {
                               setState(() {
                                    blist[p] = true;
                                        print(carlist[p]);
                               });
                             
                               print(blist[p]);
                              }
                            }
                       
                       
                       
                        },
                        child: Text('check'.tr()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent),
                      ),
                    )),
                  ],
                );
              }),
            ),
            Flexible(
              child: (cont)
                  ? Column(
                      children: <Widget>[
                        Container(
                            child: (blist[0])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        bus1,
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child:
                                                        Text('0')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus1",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus1'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus2
                        Container(
                            child: (blist[1])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus2'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus2",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus2'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus3
                        Container(
                            child: (blist[2])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus3'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus3",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus3'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),
                        ////bus4
                        Container(
                            child: (blist[3])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus4'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus4",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus4'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        // bus5
                        Container(
                            child: (blist[4])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus5'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus5",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus5'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),
                        //bus6
                        Container(
                            child: (blist[5])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus6'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus6",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus6'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus7
                        Container(
                            child: (blist[6])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus7'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus7",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus7'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ////bus8
                        Container(
                            child: (blist[7])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus8'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus8",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus8'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus9
                        Container(
                            child: (blist[8])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus9'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus9",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus9'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus10
                        Container(
                            child: (blist[9])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus10'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to'.tr(),
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat'.tr(),
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'.tr()),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      carprice,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => seatpage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus10",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  carprice)));
                                                },
                                                child: Text(('choose'.tr()) +
                                                    ('Bus10'.tr()))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),
                      ],
                    )
                  : Container(),
            )
          ]),
        ),
      );
    });
  }

  void Writedata() {
    if (selecteddate == ('Today')) {
      setState(() {
        selecteddate = '${curdat.day}/${curdat.month}/${curdat.year}';
        //today
      });
    }
    if (selecteddate == ('Tommorow')) {
      setState(() {
        selecteddate = '${today1.day}/${today1.month}/${today1.year}';
        //today
      });
    }
    if (selecteddate == (td2)) {
      setState(() {
        selecteddate = '${today2.day}/${today2.month}/${today2.year}';
        //today
      });
    }
    if (selecteddate == (td3)) {
      setState(() {
        selecteddate = '${today3.day}/${today3.month}/${today3.year}';
        //today
      });
    }
    if (selecteddate == (td4)) {
      setState(() {
        selecteddate = '${today4.day}/${today4.month}/${today4.year}';
        //today
      });
    }
    if (selecteddate == (td5)) {
      setState(() {
        selecteddate = '${today5.day}/${today5.month}/${today5.year}';
        //today
      });
    }
    if (selecteddate == (td6)) {
      setState(() {
        selecteddate = '${today6.day}/${today6.month}/${today6.year}';
        //today
      });
    }
    if (selecteddate == (td7)) {
      setState(() {
        selecteddate = '${today7.day}/${today7.month}/${today7.year}';
        //today
      });
    }

    if (dat == curdat && selecteddate != null) {
      // ignore: prefer_interpolation_to_compose_strings
      journydata.text = ("$Startingposition" " " +
          'to'.tr() +
          " " +
          "$dropdownvalue1" +
          " " +
          '$selecteddate' +
          " " +
          "$Selectedtym");
    } else if (selecteddate != null &&
        (dat.day) == (curdat.day) &&
        (dat.month) == (curdat.month) &&
        (dat.year) == (curdat.year)) {
      // ignore: prefer_interpolation_to_compose_strings
      journydata.text = ('$Startingposition' " " +
          'to' +
          " " +
          '$dropdownvalue1' +
          " " +
          '$selecteddate' +
          " " +
          '$Selectedtym');
    } else if (selecteddate != null &&
        (((dat.day) != (curdat.day)) ||
            ((dat.month) != (curdat.month)) ||
            ((dat.year) != (curdat.year)))) {
      journydata.text = ('$Startingposition' " " +
          'to' +
          " " +
          '$dropdownvalue1' +
          " " +
          '${dat.day}/${dat.month}/${dat.year}' +
          " " +
          '$Selectedtym');
    }

    setState(() {
      print(fynaldat);
      fynaldat = journydata.text;
      Selekteddate = ('${dat.day}/${dat.month}/${dat.year}');
      stod = ('$Startingposition' " " + 'to'.tr() + " " + '$dropdownvalue1')
          .toString();

          
    
    });

  


  }
}
