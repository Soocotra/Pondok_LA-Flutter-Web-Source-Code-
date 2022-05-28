import 'package:flutter/material.dart';

import 'package:villa_la02/appBar.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> galleryImage = [
      "assets/img/galeri_baris1_kolom1.jpg",
      "assets/img/galeri_baris2_kolom1.jpg",
      "assets/img/galeri_baris3_kolom1.jpg",
      "assets/img/galeri_baris4_kolom1.jpg",
      "assets/img/galeri_baris1_kolom2.jpg",
      "assets/img/galeri_baris2_kolom2.jpg"
    ];
    return Scaffold(
      drawer: (MediaQuery.of(context).size.width >= 701)
          ? null
          : SideBar("galeri", context),
      appBar: appBar(
          isActive: "galeri",
          context: context,
          appBgColor: const Color.fromARGB(255, 42, 74, 70),
          fontColor: const Color.fromARGB(255, 196, 210, 202)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 100, right: 50, left: 50),
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 42, 74, 70),
              child: const Text(
                "Galeri",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Playfair",
                    fontSize: 28,
                    color: Color.fromARGB(255, 196, 210, 202)),
              ),
            ),
            MediaQuery.of(context).size.width >= 1024
                ? Container(
                    margin: const EdgeInsets.all(40),
                    width: MediaQuery.of(context).size.width / 1.1,
                    alignment: Alignment.center,
                    child: LargeGallery(galleryImage),
                  )
                : MobileGallery(galleryImage, context),
            Footer()
          ],
        ),
      ),
    );
  }
}

Column LargeGallery(dynamic galleryImage) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage(galleryImage[0]),
                  height: 277,
                ),
                const SizedBox(
                  height: 20,
                ),
                Image(
                  image: AssetImage(galleryImage[1]),
                  height: 277,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image(
                image: AssetImage(galleryImage[4]),
              ),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage(galleryImage[2]),
                  height: 277,
                ),
                const SizedBox(
                  height: 20,
                ),
                Image(
                  image: AssetImage(galleryImage[3]),
                  height: 277,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image(
                image: AssetImage(galleryImage[5]),
                height: 567,
              ),
            ),
          )
        ],
      )
    ],
  );
}

Container MobileGallery(List<String> galleryImage, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(image: AssetImage(galleryImage[0])),
        const SizedBox(
          height: 10,
        ),
        Image(image: AssetImage(galleryImage[1])),
        const SizedBox(
          height: 10,
        ),
        Image(image: AssetImage(galleryImage[2])),
        const SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage(galleryImage[3]),
        ),
        const SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage(galleryImage[4]),
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 10,
        ),
        Image(image: AssetImage(galleryImage[5]))
      ],
    ),
  );
}
