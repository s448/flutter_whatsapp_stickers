import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stickers/utils.dart';

class details extends StatefulWidget {
  String cate;
  String pname;
  String pinde;
  bool pinstalled;

  details(this.cate, this.pname, this.pinde, this.pinstalled, {Key? key})
      : super(key: key);

  @override
  _detailsState createState() => _detailsState(cate, pname, pinde, pinstalled);
}

class _detailsState extends State<details> {
  String cate;
  String pname;
  String pinde;
  bool pinstalled;

  _detailsState(this.cate, this.pname, this.pinde, this.pinstalled);

  final WhatsAppStickers _waStickers = WhatsAppStickers();

  final String _stickerPackIdentifier1 = "2";

  final String _stickerPackIdentifier2 = "4";

  final String _stickerPackIdentifier3 = "1";

  final String _stickerPackIdentifier4 = "3";

  final String _stickerPackIdentifier5 = "5";

  final String _stickerPackIdentifier6 = "6";

  final String _stickerPackIdentifier7 = "7";

  final String _stickerPackIdentifier8 = "8";

  final String _stickerPackIdentifier9 = "9";

  final String _stickerPackIdentifier10 = "10";

  final String _stickerPackIdentifier11 = "11";

  final String _stickerPackIdentifier12 = "12";
  bool _stickerPackInstalled1 = false;
  bool _stickerPackInstalled2 = false;
  bool _stickerPackInstalled3 = false;
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

  get identifier => identifier;

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
    bool installed3 =
        await _waStickers.isStickerPackInstalled(_stickerPackIdentifier3);
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
    setState(
      () {
        _stickerPackInstalled1 = installed1;
        _stickerPackInstalled2 = installed2;
        _stickerPackInstalled3 = installed3;
        _stickerPackInstalled4 = installed4;
        _stickerPackInstalled5 = installed5;
        _stickerPackInstalled6 = installed6;
        _stickerPackInstalled7 = installed7;
        _stickerPackInstalled8 = installed8;
        _stickerPackInstalled9 = installed9;
        _stickerPackInstalled10 = installed10;
        _stickerPackInstalled11 = installed11;
        _stickerPackInstalled12 = installed12;
      },
    );
  }

  RewardedAd? rewardedAd;
  bool isLoaded2 = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RewardedAd.load(
      adUnitId: "HERE YOU SHOULD WRITE YOUR ADMOB REWARD AD UNIT",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
          print('Rewarded ad loaded');
          setState(() {
            isLoaded2 = true;
          });
        },
        onAdFailedToLoad: (error) {
          print("Ad reward failed to load !!!!!!!!!!!!!!!");
        },
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(210, 160, 26, 1),
          title: Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                ),
                Text(pname),
              ],
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.count(
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: 5,
                  children: List.generate(
                    30,
                    (index) {
                      return Image.asset(
                        'sticker_packs/$cate/${index + 1}.webp',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: StickerPackDetails(pname, pinde, pinstalled),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget StickerPackDetails(String name, String identifier, bool installed) {
    return FloatingActionButton(
      child: Container(
        child: Icon(Icons.add),
      ),
      onPressed: () async {
        if (isLoaded2) {
          print("Loaded Successfully inters..");
          rewardedAd!.show(
            onUserEarnedReward: (ad, reward) {
              _waStickers.addStickerPack(
                packageName: WhatsAppPackage.Consumer,
                stickerPackIdentifier: identifier,
                stickerPackName: name,
                listener: (action, result, {error = "Error"}) =>
                    processResponse(
                  action: action,
                  result: result,
                  error: error,
                  successCallback: checkInstallationStatuses,
                  context: context,
                ),
              );
              installed = true;
            },
          );
        }
        _waStickers.addStickerPack(
          packageName: WhatsAppPackage.Consumer,
          stickerPackIdentifier: identifier,
          stickerPackName: name,
          listener: (action, result, {error = "Error"}) => processResponse(
            action: action,
            result: result,
            error: error,
            successCallback: checkInstallationStatuses,
            context: context,
          ),
        );
        setState(() {
          pinstalled=true;
        });
      },
      backgroundColor: Color.fromRGBO(210, 160, 26, 1),
    );
  }
}
