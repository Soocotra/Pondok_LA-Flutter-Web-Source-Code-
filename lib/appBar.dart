import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:villa_la02/beranda.dart';
import 'package:villa_la02/contact.dart';
import 'package:villa_la02/galeri.dart';

//Appbar Configuration
AppBar appBar({
  required String isActive,
  required BuildContext context,
  required Color appBgColor,
  required Color fontColor,
}) {
  TextStyle styleMenu({FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(fontSize: 16, color: fontColor, fontWeight: fontWeight);
  }

  //Menu Top Right widgets
  List<Widget> action = [
    TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Home())));
        },
        child: Text(
          "Beranda",
          style: (isActive == "beranda")
              ? styleMenu(fontWeight: FontWeight.w900)
              : styleMenu(),
        )),
    TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const ContactPage())));
      },
      child: Text(
        "Hubungi Kami",
        style: (isActive == "contact")
            ? styleMenu(fontWeight: FontWeight.w900)
            : styleMenu(),
      ),
    ),
    TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => Gallery())));
      },
      child: Text(
        "Galeri",
        style: (isActive == "galeri")
            ? styleMenu(fontWeight: FontWeight.w900)
            : styleMenu(),
      ),
    ),
    const SizedBox(
      width: 50,
    )
  ];

  //Appbar content
  return AppBar(
    automaticallyImplyLeading:
        (MediaQuery.of(context).size.width >= 701) ? false : true,
    backgroundColor: appBgColor,
    foregroundColor: fontColor,
    elevation: 0,
    title: Padding(
      padding: EdgeInsets.only(
        left: (MediaQuery.of(context).size.width >= 701) ? 20 : 0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Home())));
        },
        child: const Text(
          "Villa",
          style: TextStyle(
              fontSize: 22,
              fontFamily: "Playfair",
              fontWeight: FontWeight.w700),
        ),
      ),
    ),
    actions: (MediaQuery.of(context).size.width >= 701)
        ? action
        : null, //Menu Will be dissapeared when width screen is lower than 701
  );
}

// Footer Configuration
Widget Footer() {
  return const Padding(
    padding: EdgeInsets.only(left: 70, right: 70, bottom: 20, top: 50),
    child: Text(
      "Jl. Karakal No.1 rt 02/06, Jambu Luwuk, Kec. Ciawi, Kabupaten Bogor, Jawa Barat 16720",
      style: TextStyle(fontSize: 11, fontFamily: "Playfair"),
      textAlign: TextAlign.center,
    ),
  );
}

//Drawer when width screen is lower than 701px
Drawer SideBar(String isActive, BuildContext context) {
  //Textstyle setting for every List inside Drawer, included sets font weight by certain argument
  TextStyle styleMenuList({required Page}) {
    return TextStyle(
      fontSize: 17,
      fontWeight: (isActive == Page) ? FontWeight.w900 : FontWeight.normal,
      color: (isActive == Page) ? Colors.white : HexColor("9DA2AE"),
    );
  }

  //Container configuration for every List inside Drawer, included sets color by certain argument
  InkWell MenuWrapper({Widget? child, void Function()? ontap, required page}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 13, bottom: 13),
        width: double.infinity,
        color: (isActive == page) ? HexColor("215650") : Colors.transparent,
        child: child,
      ),
    );
  }

  List<String> menuList = [
    "Beranda",
    "Hubungi Kami",
    "Galeri"
  ]; //output Text Data

  return Drawer(
    elevation: 10,
    width: 260,
    backgroundColor: HexColor("1B1B1B"),
    child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            MenuWrapper(
                page: "beranda",
                ontap: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }))),
                child: Text(menuList[0],
                    style: styleMenuList(
                      Page: "beranda",
                    ))),
            MenuWrapper(
                page: "contact",
                ontap: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ContactPage();
                    }))),
                child: Text(menuList[1],
                    style: styleMenuList(
                      Page: "contact",
                    ))),
            MenuWrapper(
                page: "galeri",
                ontap: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Gallery();
                    }))),
                child: Text(menuList[2],
                    style: styleMenuList(
                      Page: "galeri",
                    ))),
          ],
        )),
  );
}
