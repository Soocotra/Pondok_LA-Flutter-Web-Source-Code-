import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:villa_la02/appBar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    void _onMapCreated(GoogleMapController controller) {
      setState(() {
        mapController = controller;
      });
    }

    return Scaffold(
      drawer: (MediaQuery.of(context).size.width >= 701)
          ? null
          : SideBar("contact", context),
      appBar: appBar(
          isActive: "contact",
          context: context,
          appBgColor: const Color.fromARGB(255, 42, 74, 70),
          fontColor: const Color.fromARGB(255, 196, 210, 202)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 42, 74, 70),
              height: MediaQuery.of(context).size.height - 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: const Text(
                      "Lokasi",
                      style: TextStyle(
                          fontFamily: "Playfair",
                          fontSize: 28,
                          color: Color.fromARGB(255, 196, 210, 202)),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, bottom: 80),
                        width: 700,
                        height: 400,
                        child: GoogleMap(
                          markers: {
                            const Marker(
                              markerId: const MarkerId('_villaLocation'),
                              position: const LatLng(
                                  -6.691687001023778, 106.88655570552207),
                              consumeTapEvents: true,
                              infoWindow: const InfoWindow(
                                title: "Villa LA02",
                              ),
                            )
                          },
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: const CameraPosition(
                            target: const LatLng(
                                -6.691687001023778, 106.88655570552207),
                            zoom: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 60, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: TextButton(
                          child: const Text(
                            "Open in Google Maps",
                            style: TextStyle(fontSize: 12),
                          ),
                          onPressed: () {
                            launchUrlString(
                                "https://www.google.com/maps?ll=-6.692278,106.887006&z=16&t=m&hl=id&gl=US&mapclient=embed&cid=9898080427567810413");
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: HexColor("E1DFDB"),
              child: InkWell(
                  onTap: () {
                    launchUrlString(
                        "https://api.whatsapp.com/send/?phone=%2B6281280484342&text&app_absent=0");
                  },
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      padding: EdgeInsets.symmetric(
                          horizontal: (MediaQuery.of(context).size.width >= 701)
                              ? 180
                              : 100,
                          vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 42, 74, 70),
                      ),
                      child: const Text(
                        "Reservasi",
                        style: TextStyle(
                            color: Color.fromARGB(255, 196, 210, 202)),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 150),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  List<Widget> items = [
                    SizedBox(
                      height: 180,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Hubungi Kami",
                            style: TextStyle(
                                fontFamily: "Playfair",
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 11, 100, 90),
                                fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50.0),
                            child: TextButton(
                              onPressed: (() => launchUrlString(
                                  "https://api.whatsapp.com/send/?phone=%2B6281280484342&text&app_absent=0")),
                              child: const Text(
                                "Whatsapp",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          const Text(
                            "Jl. Karakal No.1 rt 02/06, Jambu Luwuk, Kec. Ciawi, Kabupaten Bogor, Jawa Barat 16720",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Jam Operasional",
                                style: TextStyle(
                                    fontFamily: "Playfair",
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 11, 100, 90),
                                    fontSize: 30)),
                            Text(
                              "Setiap hari dengan booking terlebih dahulu.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            )
                          ]),
                    ),
                  ];

                  if (constraints.maxWidth >= 730) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: items,
                    );
                  } else {
                    return Column(
                      children: items,
                    );
                  }
                },
              ),
            ),
            Photos(context, "img/gerbang.jpeg", "Gerbang LA 02"),
            const SizedBox(
              height: 100,
            ),
            Photos(context, "img/karaoke.jpeg", "Karaoke & Meeting aula"),
            Footer()
          ],
        ),
      ),
    );
  }
}

Container Photos(BuildContext context, String asset, String alt) {
  return Container(
    padding: const EdgeInsets.only(top: 100, bottom: 50),
    width: MediaQuery.of(context).size.width,
    alignment: Alignment.center,
    color: HexColor("E1DFDB"),
    child: Column(
      children: [
        Image(
          image: AssetImage(asset),
          height: 441,
          width: 770,
        ),
        Text(alt, style: const TextStyle(fontSize: 12, fontFamily: "Playfair"))
      ],
    ),
  );
}
