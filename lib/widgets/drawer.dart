import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final imgurl = "https://media.giphy.com/media/DohrzSCB07moM/giphy.gif";
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                accountName: const Text("Muskan"),
                accountEmail: const Text("muskan@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgurl),
                  onBackgroundImageError: (_, __) {},
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Home2",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.deepPurple,
              ),
              title: Text(
                "E-Mail me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
