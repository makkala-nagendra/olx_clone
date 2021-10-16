import 'package:flutter/material.dart';

import 'sub_screens/all_chats_screen.dart';
import 'sub_screens/buyer_chats_screen.dart';
import 'sub_screens/seller_chats_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Chats();
  }
}

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> with SingleTickerProviderStateMixin {
  int currentTab = 0;
  late TabController tabController;
  List tab = [
    AllChatsScreen(),
    BuyerChatsScreen(),
    SellerChatsScreen(),
  ];
  
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
              "Chats",
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
                    "ALL",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "BUYING",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "SELLING",
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
