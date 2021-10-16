import 'package:flutter/material.dart';
import 'sub_screens/ads_screen.dart';
import 'sub_screens/favourites_screen.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyAds();
  }
}

class MyAds extends StatefulWidget {
  const MyAds({Key? key}) : super(key: key);

  @override
  _MyAdsState createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> with SingleTickerProviderStateMixin {
  int currentTab = 0;
  late TabController tabController;
  List tab = const [
    AdsScreen(),
    FavouritesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController;
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "My Ads",
              style: TextStyle(color: Colors.black),
            ),
            floating: true,
            pinned: true,
            expandedHeight: 110.0,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              padding: const EdgeInsets.all(0.0),
              controller: tabController,
              onTap: (t) {
                setState(() {
                  currentTab = t;
                });
              },
              tabs: const [
                Tab(
                  child: Text(
                    "ADS",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "FAVOURITES",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      body: tab[currentTab],
    );
  }
}
