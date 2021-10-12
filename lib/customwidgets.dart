import 'package:flutter/material.dart';
import 'package:stickers/details.dart';
import 'package:url_launcher/url_launcher.dart';

import 'details.dart';

// ignore: camel_case_types
class customContainer extends StatelessWidget {
  final String category_no;
  final String asset_no;

  const customContainer({
    Key? key,
    required this.category_no,
    required this.asset_no,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      width: 50.0,
      child: Container(
        child: CustomImage(
          asset_no: asset_no,
          category_no: category_no,
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  final String c1;
  final String pack_name;
  final String id;
  final bool installed;

  const CustomListView({
    Key? key,
    required this.c1,
    required this.pack_name,
    required this.id,
    required this.installed,
  }) : super(key: key);

  get cate => c1;

  get pname => pack_name;

  get pinde => id;

  get pinstalled => installed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => details(
              cate,
              pname,
              pinde,
              pinstalled,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2, top: 2, right: 13, left: 13),
        padding: EdgeInsets.only(bottom: 2, left: 12, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade50),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,5,0),
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 6,
                          child: CustomImage(asset_no: '1', category_no: c1),
                        ),
                        Text(
                          pack_name,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  installed
                      ? Text(
                          "مثبتة",
                          style: TextStyle(color: Colors.blue.shade600),
                        )
                      : Text(
                          "غير مثبتة",
                          style: TextStyle(color: Colors.red.shade600),
                        ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              child: ListView(
                primary: false,
                shrinkWrap: true,
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  customContainer(
                    category_no: c1,
                    asset_no: '1',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  customContainer(
                    category_no: c1,
                    asset_no: '2',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  customContainer(
                    category_no: c1,
                    asset_no: '3',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  customContainer(
                    category_no: c1,
                    asset_no: '4',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomGoButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  final String asset_no;
  final String category_no;

  const CustomImage({
    Key? key,
    required this.asset_no,
    required this.category_no,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'sticker_packs/$category_no/$asset_no.webp',
      fit: BoxFit.scaleDown,
    );
  }
}

class CustomGoButton extends StatelessWidget {
  const CustomGoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      width: 70.0,
      child: Icon(
        Icons.add,
        size: 30,
        color: Color.fromRGBO(210, 160, 26, 1),
      ),
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  final String url;
  final String title;

  const CustomDrawerItem({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await canLaunch(url)
            ? await launch(url)
            : throw 'Could not launch $url';
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(210, 160, 26, 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Icon(Icons.arrow_forward_ios)],
        ),
      ),
    );
  }
}
