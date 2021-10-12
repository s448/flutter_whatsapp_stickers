import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'customwidgets.dart';

class StaticContent extends StatefulWidget {
  @override
  _StaticContentState createState() => _StaticContentState();
}

class _StaticContentState extends State<StaticContent> {
  BannerAd? bannerAd;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "HERE YOU SHOULD WRITE YOUR ADMOB BANNER AD UNIT",
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          print('Ad banner loaded.');
          setState(() {
            isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
      request: AdRequest(),
    );
    bannerAd!.load();
  }

  final WhatsAppStickers _waStickers = WhatsAppStickers();

  final String _stickerPackIdentifier1 = "1";
  final String _stickerPackName1 = "ملصقات كرتونية";

  final String _stickerPackIdentifier2 = "4";
  final String _stickerPackName2 = "ملصقات اسلامية 1";

  // final String _stickerPackIdentifier3 = "1";
  // final String _stickerPackName3 = "ملصقات اسلامية 2";

  final String _stickerPackIdentifier4 = "4";
  final String _stickerPackName4 = "ملصقات اسلامية 2";

  final String _stickerPackIdentifier5 = "5";
  final String _stickerPackName5 = "الحروف الانجليزية";

  final String _stickerPackIdentifier6 = "6";
  final String _stickerPackName6 = "ملصقات صباح الخير";

  final String _stickerPackIdentifier7 = "7";
  final String _stickerPackName7 = "ملصقات اسلامية 3";

  final String _stickerPackIdentifier8 = "8";
  final String _stickerPackName8 = "ملصقات حب";

  final String _stickerPackIdentifier9 = "9";
  final String _stickerPackName9 = "ملصقات ترفيهية";

  final String _stickerPackIdentifier10 = "10";
  final String _stickerPackName10 = "ملصقات ارشادية وترحيبية";

  final String _stickerPackIdentifier11 = "11";
  final String _stickerPackName11 = "ملصقات بنات";

  final String _stickerPackIdentifier12 = "12";
  final String _stickerPackName12 = "ملصقات قطط";

  bool _stickerPackInstalled1 = false;
  bool _stickerPackInstalled2 = false;
  // bool _stickerPackInstalled3 = false;
  bool _stickerPackInstalled4 = false;
  bool _stickerPackInstalled5 = false;
  bool _stickerPackInstalled6 = false;
  bool _stickerPackInstalled7 = false;
  bool _stickerPackInstalled8 = false;
  bool _stickerPackInstalled9 = false;
  bool _stickerPackInstalled10 = false;
  bool _stickerPackInstalled11 = false;
  bool _stickerPackInstalled12 = false;

  String catecogy1 = '1';
  String catecogy2 = '2';
  String catecogy3 = '3';
  String catecogy4 = '4';
  String catecogy5 = '5';
  String catecogy6 = '6';
  String catecogy7 = '7';
  String catecogy8 = '8';
  String catecogy9 = '9';
  String catecogy10 = '10';
  String catecogy11 = '11';
  String catecogy12 = '12';

  @override
  void initState() {
    super.initState();
    checkInstallationStatuses();
  }

  void checkInstallationStatuses() async {
    bool installed1 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier1);
    bool installed2 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier2);
    // bool installed3 =
    //     await _waStickers.isStickerPackInstalled(_stickerPackIdentifier3);
    bool installed4 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier4);
    bool installed5 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier5);
    bool installed6 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier6);
    bool installed7 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier7);
    bool installed8 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier8);
    bool installed9 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier9);
    bool installed10 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier10);
    bool installed11 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier11);
    bool installed12 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier12);
    setState(() {
      _stickerPackInstalled1 = installed1;
      _stickerPackInstalled2 = installed2;
      // _stickerPackInstalled3 = installed3;
      _stickerPackInstalled4 = installed4;
      _stickerPackInstalled5 = installed5;
      _stickerPackInstalled6 = installed6;
      _stickerPackInstalled7 = installed7;
      _stickerPackInstalled8 = installed8;
      _stickerPackInstalled9 = installed9;
      _stickerPackInstalled10 = installed10;
      _stickerPackInstalled11 = installed11;
      _stickerPackInstalled12 = installed12;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade300,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            isLoaded
                ? Container(
                    height: 50,
                    child: AdWidget(
                      ad: bannerAd!,
                    ),
                  )
                : SizedBox(
                    height: bannerAd!.size.height.toDouble(),
                    width: bannerAd!.size.width.toDouble(),
                    child: Center(
                      child: Text('Loading sponsored Ad'),
                    ),
                  ),
            SizedBox(
              height: 15,
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(
                  _stickerPackName1,
                  _stickerPackIdentifier1,
                  _stickerPackInstalled1,
                  catecogy1,
                ),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName2, _stickerPackIdentifier2,
                    _stickerPackInstalled2, catecogy2),
              ],
            ),
            // ListView(
            //   primary: false,
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.symmetric(vertical: 1),
            //   children: <Widget>[
            //     stickerPack(_stickerPackName3, _stickerPackIdentifier3,
            //         _stickerPackInstalled3, catecogy3),
            //   ],
            // ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName4, _stickerPackIdentifier4,
                    _stickerPackInstalled4, catecogy4),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName5, _stickerPackIdentifier5,
                    _stickerPackInstalled5, catecogy5),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName6, _stickerPackIdentifier6,
                    _stickerPackInstalled6, catecogy6),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName7, _stickerPackIdentifier7,
                    _stickerPackInstalled7, catecogy7),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName8, _stickerPackIdentifier8,
                    _stickerPackInstalled8, catecogy8),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName9, _stickerPackIdentifier9,
                    _stickerPackInstalled9, catecogy9),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName10, _stickerPackIdentifier10,
                    _stickerPackInstalled10, catecogy10),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName11, _stickerPackIdentifier11,
                    _stickerPackInstalled11, catecogy11),
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 1),
              children: <Widget>[
                stickerPack(_stickerPackName12, _stickerPackIdentifier12,
                    _stickerPackInstalled12, catecogy12),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget stickerPack(
      String name, String identifier, bool installed, String category) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.05,
          child: CustomListView(
            c1: category,
            pack_name: name,
            id: identifier,
            installed: installed,
          ),
        ),
      ],
    );
  }
}
