import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  var radius = 22.0;
  double i = 2;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width + i - radius, size.height);
    path.arcToPoint(Offset(size.width, size.height + i - radius),
        clockwise: true, radius: Radius.circular(radius));
    path.lineTo(size.width, -size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ChatsList extends StatelessWidget {
  final String details;
  final String latestChate;
  final String name;
  final bool isviewed;
  final String time;
  const ChatsList(
      {Key? key,
      required this.name,
      required this.details,
      required this.latestChate,
      required this.time,
      required this.isviewed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Stack(children: [
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                    ),
                  ),
                  const Align(
                    alignment: Alignment(1.8, 1.8),
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 13,
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              color: Colors.transparent.withOpacity(0.5),
                              fontSize: 11),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              details,
                              style: TextStyle(
                                color: Colors.transparent.withOpacity(0.5),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isviewed == false
                                    ? const Icon(
                                        Icons.check_rounded,
                                        size: 13,
                                      )
                                    : const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  latestChate,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.transparent.withOpacity(0.5),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class AdsList extends StatelessWidget {
  final int cost ;
  final String itemName;
  const AdsList({Key? key, required this.cost, required this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.5,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.transparent.withOpacity(0.5), width: 0.5))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const AspectRatio(
                aspectRatio: 1,
                child: Placeholder(),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₹ " + cost.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      itemName,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
