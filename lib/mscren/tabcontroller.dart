// ignore_for_file: use_key_in_widget_constructors, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newfront/mscren/mainpage.dart';

// ignore: camel_case_types
class tabcontroller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabControllerwidget();
  }
}

class TabControllerwidget extends State {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // DefaultMaterialLocalizations
      //  DefaultWidgetsLocalizations.delegate,
      //   DefaultMaterialLocalizations.delegate,
      home: mainpage(),
    debugShowCheckedModeBanner: false,

    );
  }
}
