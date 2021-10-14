import 'package:flutter/material.dart';

class AllChatsScreen extends StatelessWidget {
  AllChatsScreen({Key? key}) : super(key: key);

  final List l = [];

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
                  ],
                ),
              )
            : const ListTile(
                title: Text(
                  "data",
                ),
              );
      },
    );
  }
}
