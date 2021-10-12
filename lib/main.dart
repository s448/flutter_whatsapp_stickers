
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stickers/wallPage.dart';
import 'customwidgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'WhatsApp Stickers';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Image.asset('assets/drawer.png',fit: BoxFit.cover,),
              CustomDrawerItem(
                title: 'Telegram',
                url: 'https://t.me/stickers_arab',
              ),
              CustomDrawerItem(
                title: 'Our website',
                url: 'http://www.cyber-ar.com',
              ),
              CustomDrawerItem(
                title: 'Facebook',
                url: 'https://www.facebook.com/stickers.w/?ref=pages_you_manage',
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(210, 160,26,1),
          title: Text(title),
        ),
        body: Container(
          child: StaticContent(),
        ),
      ),
    );
  }
}
