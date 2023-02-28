// ignore_for_file: use_key_in_widget_constructors, camel_case_types, duplicate_ignore, non_constant_identifier_names

import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newfront/mscren/prejornypage.dart';
import 'package:newfront/mscren/prejornypage2.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:universal_html/html.dart';





import 'mainpage.dart';

// ignore: camel_case_types
class seatpage extends StatefulWidget {
  String Amanj;
  String bus1;
  String name;
  String phone;
  String startingplace;
  String destinationplace;
  String jprice;
  seatpage({
    Key,
    required this.Amanj,
    required this.bus1,
    required this.name,
    required this.phone,
    required this.startingplace,
    required this.destinationplace,
    required this.jprice,
  }) : super(key: null);
  @override
  State<StatefulWidget> createState() => seatpagewidget(
      Amanj, bus1, name, jprice, startingplace, destinationplace, phone);
}

class seatpagewidget extends State<seatpage> {

  String Amanj;
  String bus1;
  String name;
  String phone;
  String startingplace;
  String destinationplace;
  String jprice;
  seatpagewidget(this.Amanj, this.bus1, this.name, this.jprice,
      this.startingplace, this.destinationplace, this.phone);

  final TextEditingController set1 = TextEditingController();
  final TextEditingController set2 = TextEditingController();
  final TextEditingController set3 = TextEditingController();
  final TextEditingController set4 = TextEditingController();
  final TextEditingController tktcontrol = TextEditingController();
  


  var showpryce;
  var platnum;
  var sidenum;
  var drivernum;
  var assisnum;
  double ee = 0.0;
  DateTime dat = DateTime.now();

  var sete = [];
  basicdata() async {
    try {
      Map<String, dynamic> map9 = {"jornedata": Amanj, "car": bus1};
      print(map9);
      var body = json.encode(map9);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/cardata'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);

      var units = (json.decode(response.body) as Map<String, dynamic>);
      var nobj = units.entries.map((e) {
        return e.value;
      }).toList();

      setState(() {
        nobj.forEach((element) {
          showpryce = ('${element['price']}');
          sidenum = ('${element['sidenum']}');
          platnum = ('${element['platnum']}');
          drivernum = ('${element['drivernum']}');
          assisnum = ('${element['assisnum']}');

          ee = double.parse(showpryce);
          
        });
      });
    } on HttpException catch (e) {
      print(e.message);
    }
  }
var setnoom;
  var tyme;
  var qq;
  void tktnumcalc() {
    print('dan');
    var rng = new Random();
    var code = rng.nextInt(9000) + 1;
    String ee = code.toString();
    print('ee');

    var stg = phone.toString();

    var result = stg.substring(2, 4);
    var resultp = stg.substring(6, 10);
    stg = result + resultp;
    print('stg');

    qq = (bus1 + "-" + platnum + "-"  + "-" + stg);
    print('qq');
    tyme =
        ('${dat.day}/${dat.month}/${dat.year}/${dat.hour}:${dat.minute}:${dat.second}')
            .toString();
  }

  tktman() {
   setState(() {
      tktcontrol.text = (('tktnum :  ') +
        (qq) +
        ('\n') +
        ('Name:  ') +
        (name) +
        ('\n') +
        ('phone:  ') +
        (phone) +
        ('\n') +
        ('jornedata:  ') +
        (Amanj) +
        ('\n') +
        ('Time :  ') +
        (tyme) +
        ('\n') +
        ('seatnum :  ') +
       (setnoom) +
        ('\n') +
        ('car :  ') +
        (bus1) +
        ('\n') +
        ('platnum :  ') +
        (platnum) +
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
        (set4.text.toString().trim()) +
        ('\n'));
   });
  }

  void tktdata() async {
    try {
      Map<String, dynamic> map1 = {
        "tktnum": qq,
        "name": name,
        "phone": phone,
        "jornedata": Amanj,
        "seatnum": sete,
        "car": bus1,
        "platnum": platnum,
        "sidenum": sidenum,
        "drivernum": drivernum,
        "assisnum": assisnum,
        "price": set4.text.toString().trim(),
        "time": tyme,
      };

      var body = json.encode(map1);
      print(body);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      final response = await http.post(
        Uri.parse('http://localhost:9000/users/pasd'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Not  successfully'),
            content: Text(' try again '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      } else if(response.statusCode == 200) {
        print('qwerty');
        tktman();
        await showDialog(
          context: context,
          builder: (context) => 
          Dialog(
            child: Container(
              height: 500,
              width: 300,
              child: ListView(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                    "booked Successfully",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  ),
                 
                  
                  TextField(
                    controller: tktcontrol,
                    maxLines: null,
                  ),

                  Container(
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            height: 30,
                            width: 100, child:   ElevatedButton(onPressed: (){_creatpdf();
                              // Navigator.of(context).push(
                              //                         MaterialPageRoute(
                              //                             builder: (context) => seatpage(
                              //                                 Amanj: journydata
                              //                                     .text,
                              //                                 bus1: "bus1",
                              //                                 name: nam.text,
                              //                                 phone: fon.text,
                              //                                 startingplace:
                              //                                     dropdownvalue
                              //                                         .toString(),
                              //                                 destinationplace:
                              //                                     dropdownvalue1
                              //                                         .toString(),
                              //                                 jprice:
                              //                                     carprice)));
                            Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => prejornypage2(

                                           tktnum: qq,
                                             
                                            phone: phone,
                                          
                                        ),
                                      ));
                                      
                                      }, child: Text("Download")
                                      ),
                                      ),
                          
                          ),
                       Flexible(
                          child: Container(
                             margin: EdgeInsets.all(5),
                              height: 30,
                            width: 100, child:   ElevatedButton(onPressed: (){
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        
                                        builder: (_) => prejornypage(
                                            
                                        ),
                                      ));
                            }, child: Text("cancel")),),
                          
                          ),
                      ],
                    ),
                  )

                
                ],
              ),
            ),
          ),
        );
      }
    } catch (error) {}
  }
    var setnumcol = [];
     
            var linear1=[];
             var linear;
 static var chr1 = true;
  static var chr2 = true;
  static var chr3 = true;
  static var chr4 = true;
  static var chr5 = true;
  static var chr6 = true;

             var chairlist = [
   chr1,
  chr2,
 chr3,
 chr4,
 chr5,
 chr6
   
  ];
  setnumbercol() async {
    print('setnumber collected');
    try {
      Map<String, dynamic> map = {
        "car": bus1,
        "jornedata":Amanj
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


      setState(() {
        setnumcol = data["data"].toList();
      linear1=setnumcol[0];
      print(linear1);

  linear= linear1.expand((i) => i).toList();

  print(linear);
  

  for(var ss=0;ss<linear.length;ss++)
  {
  setState(() {


    // var ww=linear[ss];

    print('ww');
    
      
      if((linear[ss]=='1'))
    {
  print('chair1');
      chairlist[ss]=false;
 
    }
    else if(linear[ss]=='2')
    {
       print('chair2');
       
      chairlist[ss]=false;
    }
     else if(linear[ss]=='3')
    {
       print('chair3');
      chairlist[ss]=false;
    }
     else if(linear[ss]=='4')
    {
     
      chairlist[ss]=false;
    }
  });

  }


  
      });



    } on HttpException {}
  }

  Future<void> _creatpdf() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
  page.graphics.drawString(
       (tktcontrol.text.toString().trim()), PdfStandardFont(PdfFontFamily.helvetica, 10),
       brush: PdfBrushes.black,
       bounds: const Rect.fromLTWH(10, 10, 0, 0));
   // print(page);
  //  List<dynamic> bytes = await document.save();
      final List<int> bytes =  await  document.save();
    document.dispose();
    await SaveAndLaunchFile(bytes, 'outputs.pdf');
  }

  @override
  void initState() {
    // TODO: implement initState

    //  print(Amanj);
    basicdata();
    setnumbercol();
   
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      double width = MediaQuery.of(context).size.width;
      return Scaffold(
        body: Container(
          child: ListView(
            children: [
              Flexible(
                  child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const mainpage(),
                              )),
                          icon: const Icon(Icons.arrow_back_sharp),
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: width * 0.1,
                      ),
                      Container(
                          width: width * 0.6,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  (bus1),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  (startingplace +
                                      " " +
                                      'to' +
                                      " " +
                                      destinationplace),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )),
              Flexible(
                  child: Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  'Select Seat and make your payment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )),
              Flexible(
                  child: Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chair_outlined),
                        color: Colors.green,
                      ),
                    ),
                    const Text('Available Seat'),
                    SizedBox(
                      height: 30,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chair_outlined),
                        color:Color.fromARGB(255, 165, 157, 155)
                      ),
                    ),
                    const Text('taken Seat'),
                  ],
                ),
              )),

              /////////////////////
              Flexible(
                  child: Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(blurRadius: 2)]),
                                child: Container(
                                  height: 400,
                                  width: width * 0.7,
                                  color: Colors.white,
                                  margin: EdgeInsets.all(5),
                                  child: ListView(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.mode_standby_rounded),
                                                color: (true)
                                                    ? Colors.green
                                                    // ignore: dead_code
                                                    : Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ////////////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              // ignore: sort_child_properties_last
                                              child: GestureDetector(
                                                onDoubleTap: (chairlist[0])
                                                    ? ((() {
                                                        double ee =
                                                            double.parse(
                                                                showpryce);

                                                      

                                                        if ((set1.text
                                                                .isEmpty) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '1'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '1')))) {
                                                          setState(() {
                                                            set1.text = ('1');

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 1}' +
                                                                      'birr');
                                                            } else if (((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty))) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              setState(() {
                                                                set4.text =
                                                                    ('${ee * 3}' +
                                                                        'birr');
                                                              });
                                                            }
                                                          });
                                                        } else if ((set2.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '1'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '1')))) {
                                                          set2.text = ('1');

                                                          if ((set1.text
                                                                  .isEmpty) &&
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}' +
                                                                    'birr');
                                                          } else if ((set1.text
                                                                  .isEmpty) ||
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}' +
                                                                    'birr');
                                                          } else if ((set1.text
                                                                  .isNotEmpty) &&
                                                              (set3.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}' +
                                                                    'birr');
                                                          }
                                                        } else if ((set3.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '1'))) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '1')))) {
                                                          set3.text = ('1');

                                                          if ((set2.text
                                                                  .isEmpty) &&
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}' +
                                                                    'birr');
                                                          } else if ((set2.text
                                                                  .isEmpty) ||
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}' +
                                                                    'birr');
                                                          } else if ((set2.text
                                                                  .isNotEmpty) &&
                                                              (set1.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}' +
                                                                    'birr');
                                                          }
                                                        }
                                                      }))
                                                    : null,
                                                child: IconButton(
                                                  onPressed: (chairlist[0])
                                                      ? ((() {
                                                          double ee =
                                                              double.parse(
                                                                  showpryce);
                                                          if (set1.text
                                                              .trim()
                                                              .contains('1')) {
                                                            set1.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          } else if (set2.text
                                                              .trim()
                                                              .contains('1')) {
                                                            set2.clear();

                                                            if ((set1.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set1
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set1
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          } else if (set3.text
                                                              .trim()
                                                              .contains('1')) {
                                                            set3.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set1.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          }
                                                        }))
                                                      : null,
                                                  icon: const Icon(
                                                      Icons.chair_outlined),
                                                  color: (chairlist[0])
                                                      ? Colors.green
                                                   
                                                      : Colors.red,
                                                ),
                                              ),

                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                            ),

                                            ///chair2
                                            Container(
                                              // ignore: sort_child_properties_last
                                              child: GestureDetector(
                                                onDoubleTap: (chairlist[1])
                                                    ? ((() {
                                                        double ee =
                                                            double.parse(
                                                                showpryce);

                                                        if ((set1.text
                                                                .isEmpty) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '2'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '2')))) {
                                                          setState(() {
                                                            set1.text = ('2');

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 1}' +
                                                                      'birr');
                                                            } else if (((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty))) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              setState(() {
                                                                set4.text =
                                                                    ('${ee * 3}' +
                                                                        'birr');
                                                              });
                                                            }
                                                          });
                                                        } else if ((set2.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '2'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '2')))) {
                                                          set2.text = ('2');

                                                          if ((set1.text
                                                                  .isEmpty) &&
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}' +
                                                                    'birr');
                                                          } else if ((set1.text
                                                                  .isEmpty) ||
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}' +
                                                                    'birr');
                                                          } else if ((set1.text
                                                                  .isNotEmpty) &&
                                                              (set3.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}' +
                                                                    'birr');
                                                          }
                                                        } else if ((set3.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '2'))) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '2')))) {
                                                          set3.text = ('2');

                                                          if ((set2.text
                                                                  .isEmpty) &&
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}' +
                                                                    'birr');
                                                          } else if ((set2.text
                                                                  .isEmpty) ||
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}' +
                                                                    'birr');
                                                          } else if ((set2.text
                                                                  .isNotEmpty) &&
                                                              (set1.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}' +
                                                                    'birr');
                                                          }
                                                        }
                                                      }))
                                                    : null,
                                                child: IconButton(
                                                  onPressed: (chairlist[1])
                                                      ? ((() {
                                                          double ee =
                                                              double.parse(
                                                                  showpryce);
                                                          if (set1.text
                                                              .trim()
                                                              .contains('2')) {
                                                            set1.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          } else if (set2.text
                                                              .trim()
                                                              .contains('2')) {
                                                            set2.clear();

                                                            if ((set1.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set1
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set1
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          } else if (set3.text
                                                              .trim()
                                                              .contains('2')) {
                                                            set3.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set1.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          }
                                                        }))
                                                      : null,
                                                  icon: const Icon(
                                                      Icons.chair_outlined),
                                                  color: (chairlist[1])
                                                      ? Colors.green
                                                      
                                                      : Colors.red,
                                                ),
                                              ),

                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            //////chair3
                                            Container(
                                              // ignore: sort_child_properties_last
                                              child: GestureDetector(
                                                onDoubleTap: (chairlist[2])
                                                    ? ((() {
                                                        double ee =
                                                            double.parse(
                                                                showpryce);

                                                        if ((set1.text
                                                                .isEmpty) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '3'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '3')))) {
                                                          setState(() {
                                                            set1.text = ('3');

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 1}' +
                                                                      'birr');
                                                            } else if (((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty))) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              setState(() {
                                                                set4.text =
                                                                    ('${ee * 3}' +
                                                                        'birr');
                                                              });
                                                            }
                                                          });
                                                        } else if ((set2.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '3'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '3')))) {
                                                          set2.text = ('3');

                                                          if ((set1.text
                                                                  .isEmpty) &&
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}' +
                                                                    'birr');
                                                          } else if ((set1.text
                                                                  .isEmpty) ||
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}' +
                                                                    'birr');
                                                          } else if ((set1.text
                                                                  .isNotEmpty) &&
                                                              (set3.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}' +
                                                                    'birr');
                                                          }
                                                        } else if ((set3.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '3'))) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '3')))) {
                                                          set3.text = ('3');

                                                          if ((set2.text
                                                                  .isEmpty) &&
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}' +
                                                                    'birr');
                                                          } else if ((set2.text
                                                                  .isEmpty) ||
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}' +
                                                                    'birr');
                                                          } else if ((set2.text
                                                                  .isNotEmpty) &&
                                                              (set1.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}' +
                                                                    'birr');
                                                          }
                                                        }
                                                      }))
                                                    : null,
                                                child: IconButton(
                                                  onPressed: (chairlist[2])
                                                      ? ((() {
                                                          double ee =
                                                              double.parse(
                                                                  showpryce);
                                                          if (set1.text
                                                              .trim()
                                                              .contains('3')) {
                                                            set1.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          } else if (set2.text
                                                              .trim()
                                                              .contains('3')) {
                                                            set2.clear();

                                                            if ((set1.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set1
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set1
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          } else if (set3.text
                                                              .trim()
                                                              .contains('3')) {
                                                            set3.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}' +
                                                                      'birr');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set1.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}' +
                                                                      'birr');
                                                            }
                                                          }
                                                        }))
                                                      : null,
                                                  icon: const Icon(
                                                      Icons.chair_outlined),
                                                  color: (chairlist[2])
                                                      ? Colors.green
                                                    
                                                      : Colors.red,
                                                ),
                                              ),

                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                            ),
                                            //////////chair4
                                            Container(
                                              // ignore: sort_child_properties_last
                                              child: GestureDetector(
                                                onDoubleTap: (chairlist[3])
                                                    ? ((() {
                                                        double ee =
                                                            double.parse(
                                                                showpryce);

                                                        if ((set1.text
                                                                .isEmpty) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '4'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '4')))) {
                                                          setState(() {
                                                            set1.text = ('4');

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 1}');
                                                            } else if (((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty))) {
                                                              set4.text =
                                                                  ('${ee * 2}');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              setState(() {
                                                                set4.text =
                                                                    ('${ee * 3}');
                                                              });
                                                            }
                                                          });
                                                        } else if ((set2.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '4'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '4')))) {
                                                          set2.text = ('4');

                                                          if ((set1.text
                                                                  .isEmpty) &&
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}');
                                                          } else if ((set1.text
                                                                  .isEmpty) ||
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}');
                                                          } else if ((set1.text
                                                                  .isNotEmpty) &&
                                                              (set3.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}');
                                                          }
                                                        } else if ((set3.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '4'))) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '4')))) {
                                                          set3.text = ('4');

                                                          if ((set2.text
                                                                  .isEmpty) &&
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}');
                                                          } else if ((set2.text
                                                                  .isEmpty) ||
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}');
                                                          } else if ((set2.text
                                                                  .isNotEmpty) &&
                                                              (set1.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}');
                                                          }
                                                        }
                                                      }))
                                                    : null,
                                                child: IconButton(
                                                  onPressed: (chairlist[3])
                                                      ? ((() {
                                                          double ee =
                                                              double.parse(
                                                                  showpryce);
                                                          if (set1.text
                                                              .trim()
                                                              .contains('4')) {
                                                            set1.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}');
                                                            }
                                                          } else if (set2.text
                                                              .trim()
                                                              .contains('4')) {
                                                            set2.clear();

                                                            if ((set1.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set1
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}');
                                                            } else if ((set1
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}');
                                                            }
                                                          } else if (set3.text
                                                              .trim()
                                                              .contains('4')) {
                                                            set3.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set1.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}');
                                                            }
                                                          }
                                                        }))
                                                      : null,
                                                  icon: const Icon(
                                                      Icons.chair_outlined),
                                                      style: IconButton.styleFrom(
                                                         
                                                   backgroundColor : (chairlist[3])
                                                      ?(Colors.green)
                                                 :( Colors.red)),
                                                
                                                ),
                                              ),

                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Container(
                                        child: Row(
                                          children: [
                                            ////////////////chair5
                                            Container(
                                              // ignore: sort_child_properties_last
                                              child: GestureDetector(
                                                onDoubleTap: (true)
                                                    ? ((() {
                                                        double ee =
                                                            double.parse(
                                                                showpryce);

                                                        if ((set1.text
                                                                .isEmpty) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '4'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '4')))) {
                                                          setState(() {
                                                            set1.text = ('4');

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 1}');
                                                            } else if (((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty))) {
                                                              set4.text =
                                                                  ('${ee * 2}');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              setState(() {
                                                                set4.text =
                                                                    ('${ee * 3}');
                                                              });
                                                            }
                                                          });
                                                        } else if ((set2.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '4'))) &&
                                                            (!(set3.text
                                                                .trim()
                                                                .contains(
                                                                    '4')))) {
                                                          set2.text = ('4');

                                                          if ((set1.text
                                                                  .isEmpty) &&
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}');
                                                          } else if ((set1.text
                                                                  .isEmpty) ||
                                                              (set3.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}');
                                                          } else if ((set1.text
                                                                  .isNotEmpty) &&
                                                              (set3.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}');
                                                          }
                                                        } else if ((set3.text
                                                                .isEmpty) &&
                                                            (!(set1.text
                                                                .trim()
                                                                .contains(
                                                                    '4'))) &&
                                                            (!(set2.text
                                                                .trim()
                                                                .contains(
                                                                    '4')))) {
                                                          set3.text = ('4');

                                                          if ((set2.text
                                                                  .isEmpty) &&
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 1}');
                                                          } else if ((set2.text
                                                                  .isEmpty) ||
                                                              (set1.text
                                                                  .isEmpty)) {
                                                            set4.text =
                                                                ('${ee * 2}');
                                                          } else if ((set2.text
                                                                  .isNotEmpty) &&
                                                              (set1.text
                                                                  .isNotEmpty)) {
                                                            set4.text =
                                                                ('${ee * 3}');
                                                          }
                                                        }
                                                      }))
                                                    : null,
                                                child: IconButton(
                                                  onPressed: (true)
                                                      ? ((() {
                                                          double ee =
                                                              double.parse(
                                                                  showpryce);
                                                          if (set1.text
                                                              .trim()
                                                              .contains('4')) {
                                                            set1.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}');
                                                            }
                                                          } else if (set2.text
                                                              .trim()
                                                              .contains('4')) {
                                                            set2.clear();

                                                            if ((set1.text
                                                                    .isEmpty) &&
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set1
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set3.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}');
                                                            } else if ((set1
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set3.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}');
                                                            }
                                                          } else if (set3.text
                                                              .trim()
                                                              .contains('4')) {
                                                            set3.clear();

                                                            if ((set2.text
                                                                    .isEmpty) &&
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text = '0';
                                                            } else if ((set2
                                                                    .text
                                                                    .isEmpty) ||
                                                                (set1.text
                                                                    .isEmpty)) {
                                                              set4.text =
                                                                  ('${ee}');
                                                            } else if ((set2
                                                                    .text
                                                                    .isNotEmpty) &&
                                                                (set1.text
                                                                    .isNotEmpty)) {
                                                              set4.text =
                                                                  ('${ee * 2}');
                                                            }
                                                          }
                                                        }))
                                                      : null,
                                                  icon: const Icon(
                                                      Icons.chair_outlined),
                                                  color: (true)
                                                      ? Colors.green
                                                      // ignore: dead_code
                                                      : Colors.red,
                                                ),
                                              ),

                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                            ),

                                            ////chair6
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ///////////////////////

                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ////////////////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(width: 38),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //////////////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ///////////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //////////////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //////////////////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ///////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ////////////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                          ],
                                        ),
                                      ),
                                      ////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ///////////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 38,
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /////////////
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 2),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: (true)
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.chair_outlined),
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.3,
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                              child: const Text(
                                'Selected Seat',
                                style: TextStyle(fontSize: 15),
                              )),
                          Container(
                              height: 20,
                              width: 50,
                              margin: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                              child: TextField(
                                controller: set1,
                                readOnly: true,
                                // ignore: prefer_const_constructors
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                ),
                              )),
                          Container(
                              height: 20,
                              width: 50,
                              margin: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                              child: TextField(
                                controller: set2,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              )),
                          Container(
                              height: 20,
                              width: 50,
                              margin: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                              child: TextField(
                                controller: set3,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              )),
                          Container(
                              height: 30,
                              width: 100,
                              margin: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                              child: TextField(
                                controller: set4,
                                //  readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Flexible(
                  child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: const Text(
                  'payment',
                  style: TextStyle(fontSize: 15),
                ),
              )),
              Flexible(
                  child: Container(
                height: 70,
                margin: const EdgeInsets.all(5),
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                        child: Container(
                            width: 80,
                            height: 70,
                            margin: EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 2)],
                              image: DecorationImage(
                                image: AssetImage('images/telebirr.png'),
                              ),
                              //  child: Text("clickMe") // button text
                            )),
                        onTap: () {
                          tktnumcalc();
                          setState(() {
                            setState(() {
                              if (set1.text.isNotEmpty &&
                                  set2.text.isNotEmpty &&
                                  set3.text.isNotEmpty) {
                                sete.add(set1.text);
                                sete.add(set2.text);
                                sete.add(set3.text);
                                setnoom= " "+set1.text+" , "+set2.text+" , "+set3.text;
                              } else if (set1.text.isNotEmpty &&
                                  set2.text.isEmpty &&
                                  set3.text.isEmpty) {
                                sete.add(set1.text);
                                 setnoom= " "+set1.text;
                              } else if (set1.text.isEmpty &&
                                  set2.text.isNotEmpty &&
                                  set3.text.isEmpty) {
                                sete.add(set2.text);
                                 setnoom= " "+set2.text;
                              } else if (set1.text.isEmpty &&
                                  set2.text.isEmpty &&
                                  set3.text.isNotEmpty) {
                                sete.add(set3.text);
                                   setnoom= " "+set3.text;
                              } else if (set1.text.isNotEmpty &&
                                  set2.text.isNotEmpty &&
                                  set3.text.isEmpty) {
                                sete.add(set1.text);
                                sete.add(set2.text);
                                setnoom= " "+set1.text+" , "+set2.text;
                              } else if (set1.text.isNotEmpty &&
                                  set2.text.isEmpty &&
                                  set3.text.isNotEmpty) {
                                sete.add(set1.text);
                                sete.add(set3.text);
                                setnoom= " "+set1.text+" , "+set3.text;
                              } else if (set1.text.isEmpty &&
                                  set2.text.isNotEmpty &&
                                  set3.text.isNotEmpty) {
                                sete.add(set2.text);
                                sete.add(set3.text);
                                setnoom= " "+set2.text+" , "+set3.text;
                              }
                            });
                            print('tkt data to be printed ');
                            tktdata();
                          });
                        }),
                    GestureDetector(
                        child: Container(
                            width: 80,
                            height: 68,
                            margin: EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 2)],
                              image: DecorationImage(
                                image: AssetImage('images/cbebirr.jpg'),
                              ),
                              //  child: Text("clickMe") // button text
                            )),
                        onTap: () {
                          print("you clicked me");
                        }),
                    GestureDetector(
                        child: Container(
                            width: 80,
                            height: 68,
                            margin: EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 2)],
                              image: DecorationImage(
                                image: AssetImage('images/Amole.jpg'),
                              ),
                              //  child: Text("clickMe") // button text
                            )),
                        onTap: () {
                          print("you clicked me");
                        }),
                    Flexible(
                      child: Container(
                        color: Colors.green,
                        margin: const EdgeInsets.all(4),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: Colors.yellow,
                        margin: const EdgeInsets.all(4),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: Colors.purpleAccent,
                        margin: const EdgeInsets.all(4),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      );
    });
  }

 static Future<void> SaveAndLaunchFile(bytes, String fileName) async {
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", fileName)
      ..click();
  }
}

