import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String location = "My_location";
  List<dynamic> data = [];

  int cost = 00000;
  String sellerLocation = "Location";
  String itemDetail = "Item details in 2 lines.\n ...";

  bool isScrolled = true;

  bool isLoading = false;
  int currentLength = 0;

  int totallDataLength = 100;
  int totall = 20;
  final int increment = 10;

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  Future _loadMore() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    for (var i = currentLength;
        i < currentLength + increment && i < totallDataLength;
        i++) {
      if (i < totallDataLength) {
        data.add(i);
      } else {}
    }
    setState(() {
      isLoading = false;
      currentLength = data.length;
    });
  }

  @override
  void dispose() {
    super.dispose();
    data;
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            elevation: 5.0,
            backgroundColor: Colors.white,
            title: InkWell(
              onTap: () {
                setState(() {});
              },
              child: SizedBox(
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.black),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.black),
                  ],
                ),
              ),
            ),
            floating: true,
            pinned: true,
            expandedHeight: 110.0,
            forceElevated: innerBoxIsScrolled,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.search),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Find Cars, Mobile Phones and more...")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _loadMore();
                        });
                      },
                      icon: const Icon(Icons.notifications_none),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ];
      },
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (!isLoading &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            if (currentLength < totallDataLength) {
              _loadMore();
            }
            setState(() {
              if (currentLength < totallDataLength) {
                isLoading = true;
              } else if (currentLength >= totallDataLength) {
                isLoading = false;
              }
            });
          }
          return false;
        },
        child: Column(
          children: [
            Expanded(child: gridItem()),
            isLoading == true
                ? const SizedBox(
                    height: 50,
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        child: LinearProgressIndicator(
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget gridItem() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: data.length + 2,
      itemBuilder: (BuildContext context, int index) => index == 0
          ? carSellContainer()
          : index == 1
              ? browserList()
              : itemsGridView(index),
      staggeredTileBuilder: (int index) => index == 0
          ? const StaggeredTile.count(4, 2.5) //First grid eliment
          : index == 1
              ? const StaggeredTile.count(4, 1.3) //First grid eliment

              : const StaggeredTile.count(2, 2), //Items
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  Widget carSellContainer() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          color: Colors.blue,
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Placeholder(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {},
                              child: const Card(
                                child: SizedBox(
                                    height: 60,
                                    child: Center(child: Text("Buy Car"))),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {},
                              child: const Card(
                                child: SizedBox(
                                    height: 60,
                                    child: Center(child: Text("Sell Car"))),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget browserList() {
    double w = 100, iconSize = 50;
    TextStyle tStyle = const TextStyle(fontSize: 8.0);
    Color iconColor = Colors.transparent.withOpacity(1);
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Browse categories",
                  style: TextStyle(fontSize: 12),
                ),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "See all >",
                      style: TextStyle(
                        fontSize: 12,
                        decorationThickness: 2,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              //OLX AUTOS (CARS)
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_car_outlined,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "OLX AUTOS (CARS)",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //PROPERTIES
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apartment_rounded,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "PROPERTIES",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //MOBILES
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_iphone_rounded,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "MOBILES",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //JOB
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "JOB",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //BIKES
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pedal_bike_sharp,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "BIKES",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //ELECTRONICS & APPLIANCES
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.computer_rounded,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "ELECTRONICS & APPLIANCES",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //COMMERCIAL VEHICLES & SPARES
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.build,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "COMMERCIAL VEHICLES & SPARES",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //FURNITURE
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bed_outlined,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "FURNITURE",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //FASHION
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.checkroom_outlined,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "FASHION",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //BOOKS, SPORTS & HOBBIES
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "BOOKS, SPORTS & HOBBIES",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //PETS
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pets,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "PETS",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //SERVICES
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.room_service_outlined,
                          size: iconSize,
                          color: iconColor,
                        ),
                        Text(
                          "SERVICES",
                          style: tStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 10,
          color: Colors.transparent.withOpacity(0.1),
        ),
      ],
    );
  }

  Widget itemsGridView(index) {
    return SizedBox(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 0.5, color: Colors.transparent.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AspectRatio(
                  aspectRatio: 1.5,
                  child: SizedBox(
                    child: Placeholder(),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "₹" + (index - 2).toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AspectRatio(
                  aspectRatio: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      itemDetail,
                      style: const TextStyle(fontSize: 11),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: Opacity(
                        opacity: 0.7,
                        child: Text(
                          sellerLocation,
                          style: const TextStyle(fontSize: 10),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
