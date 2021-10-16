import 'package:flutter/material.dart';

import 'screen_elements.dart';

class SellerChatsScreen extends StatelessWidget {
  SellerChatsScreen({Key? key}) : super(key: key);
  final List l = [1];
  final TextStyle listStyle = TextStyle(
    fontSize: 10,
    color: Colors.transparent.withOpacity(0.5),
  );
  final bool isviewed = false;
  final String name = "Name";
  final String details = "Details";
  final String latestChate = "Latest message";
  final String time = "05:15 AM";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: l.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Opacity(
                opacity: 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "QUICK FILTERS",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green.withOpacity(0.3)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "All",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green.withOpacity(0.3)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Meeting",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green.withOpacity(0.3)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Unread",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green.withOpacity(0.3)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Important",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            : InkWell(
                onTap: () {},
                onLongPress: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChatsList(
                    details: details,
                    name: name,
                    isviewed: isviewed,
                    latestChate: latestChate,
                    time: time,
                  ),
                ),
              );
      },
    );
  }
}
