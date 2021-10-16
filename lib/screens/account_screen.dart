import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  final String name = "Name";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "View and edit profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text("6 Steps left"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SizedBox(
                height: 12,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Expanded(child: Container(color: Colors.amber)),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Container(color: Colors.amber)),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Container(color: Colors.amber)),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Container(color: Colors.amber)),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Container(color: Colors.amber)),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Container(color: Colors.amber)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "OLX is buit on trust, Help other pepole get to know you. Tell them about the things you like.",
                  style: TextStyle(
                      fontSize: 11, color: Colors.transparent.withOpacity(0.6)),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.payment),
              title: const Text("Buy Packages & My Orders"),
              subtitle: const Text("Packages, orders, billing and invoices"),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              subtitle: const Text("Privacy and logout"),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.help),
              title: const Text("Help & Support"),
              subtitle: const Text("Help center and legal terms"),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.language),
              title: const Text("Select Language"),
              subtitle: const Text("English"),
              trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
