import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:villa_la02/appBar.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<String> reviewLink = [
      "https://www.google.com/maps/reviews/@-6.6990398,106.898396,15z/data=!4m5!14m4!1m3!1m2!1s108620069536455958357!2s0x0:0x895d0bb4e36d076d?hl=id-ID",
      "https://www.google.com/maps/reviews/data=!4m5!14m4!1m3!1m2!1s108899777976386237338!2s0x0:0x895d0bb4e36d076d?hl=id-ID&shorturl=1",
      "https://www.google.com/maps/reviews/data=!4m5!14m4!1m3!1m2!1s113742309869261001895!2s0x0:0x895d0bb4e36d076d?hl=id-ID&shorturl=1",
      "https://www.google.com/maps/reviews/@-6.6917034,106.8865514,17z/data=!3m1!4b1!4m5!14m4!1m3!1m2!1s103286246418713268481!2s0x0:0x895d0bb4e36d076d?hl=id-ID"
    ];

    TextButton sumberReview(String url) {
      return TextButton(
          onPressed: () {
            launchUrlString(url);
          },
          child: const Text(
            "Sumber",
            style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: "Playfair",
                decoration: TextDecoration.underline),
          ));
    }

    TextStyle testimoni = const TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontStyle: FontStyle.italic,
        fontFamily: "Playfair");

    List<Widget> items(double width) {
      return [
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  right: 10,
                ),
                width: width,
                child: Text(
                  "\"bagus banget villa nya, kamar nya banyak, kolam renang nya juga luas cocok bgt ni buat acara tour keluarga besar\"",
                  textAlign: TextAlign.center,
                  style: testimoni,
                ),
              ),
              sumberReview(reviewLink[0])
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20, right: 10),
              width: width,
              child: Text(
                "\"Mantul\"",
                textAlign: TextAlign.center,
                style: testimoni,
              ),
            ),
            sumberReview(reviewLink[1])
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20, right: 10),
              width: width,
              child: Text(
                "\"Tempat yang asik buat weekend selain ga jauh dari pintu Tol Gadog juga tempatnya nyaris sempurna.\"",
                textAlign: TextAlign.center,
                style: testimoni,
              ),
            ),
            sumberReview(reviewLink[2])
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              width: width,
              child: Text(
                "\"Bagus, cocok buat keluarga.\"",
                textAlign: TextAlign.center,
                style: testimoni,
              ),
            ),
            sumberReview(reviewLink[3])
          ],
        ))
      ];
    }

    return Scaffold(
      drawer: (MediaQuery.of(context).size.width >= 701)
          ? null
          : SideBar("beranda", context),
      appBar: appBar(
          isActive: "beranda",
          context: context,
          appBgColor: Colors.white,
          fontColor: Colors.black),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Pondok LA 02",
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 100, 90),
                          fontWeight: FontWeight.w900,
                          fontSize: 55,
                          fontFamily: "Playfair")),
                  SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      "Villa berkonsep rumah pondokan yang dikelilingi kebun buah dan sayur serta saung.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 33, 33, 33),
                          fontFamily: "Playfair"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 70),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 42, 74, 70),
              child: InkWell(
                  onTap: () {
                    launchUrlString(
                        "https://api.whatsapp.com/send/?phone=%2B6281280484342&text&app_absent=0");
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      padding: EdgeInsets.symmetric(
                          horizontal: (MediaQuery.of(context).size.width >= 701)
                              ? 150
                              : 100,
                          vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: const Text(
                        "Reservasi",
                        style:
                            TextStyle(color: Color.fromARGB(255, 11, 100, 90)),
                      ))),
            ),
            Image(image: AssetImage("img/pool.jpeg")),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Swimming Pool Pondok LA 02",
                style: TextStyle(fontSize: 12, fontFamily: "Playfair"),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              width: 700,
              // height: 220,
              child: Padding(
                padding: EdgeInsets.only(left: 60, right: 60, bottom: 60),
                child: Text(
                  "Pondok LA 02 berbeda dengan Villa kebanyakan, Selain view diantara 3 Gunung juga menawarkan wisata edukasi terutama buat anak-anak antara lain edukasi perkebunan, pertanian dan perikanan.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 11, 100, 90),
                      fontSize: 25,
                      fontFamily: "Playfair"),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 60),
              alignment: Alignment.center,
              height: 150,
              color: Color.fromARGB(255, 42, 74, 70),
              child: const Text(
                "Testimoni",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Playfair", fontSize: 25),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 701) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 1.7,
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: items(150),
                    ),
                  );
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    height: 700,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: items(MediaQuery.of(context).size.width),
                    ),
                  );
                }
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Color.fromARGB(255, 42, 74, 70),
              margin: EdgeInsets.only(bottom: 150),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
