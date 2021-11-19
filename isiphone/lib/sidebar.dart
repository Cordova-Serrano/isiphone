import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Admin';
    final email = 'admin@gmail.com';
    final urlImage =
        'https://t3.ftcdn.net/jpg/02/36/48/86/360_F_236488644_opXVvD367vGJTM2I7xTlsHB58DVbmtxR.jpg';
    return Drawer(
      child: Material(
        color: Color.fromRGBO(239, 235, 235, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              image: 'assets/images/logo_mini.png',
              name: 'ISI PHONE',
              onClicked: () => {},
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: Colors.black54),
            const SizedBox(height: 8),
            buildMenuItem(
              text: 'Inventario',
              icon: Icons.inventory_sharp,
            ),
            const SizedBox(height: 8),
            buildMenuItem(
              text: 'Añadir Nuevo Teléfono',
              icon: Icons.add,
            ),
            const SizedBox(height: 240),
            Divider(color: Colors.black54),
            const SizedBox(height: 8),
            buildFooter(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => {},
            )
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
}) {
  final color = Colors.black;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    onTap: () {},
  );
}

Widget buildFooter({
  required String urlImage,
  required String name,
  required String email,
  required VoidCallback onClicked,
}) =>
    InkWell(
      onTap: onClicked,
      child: Container(
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 20, color: Colors.black)),
                const SizedBox(height: 4),
                Text(email,
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromRGBO(239, 235, 235, 1),
              child: Icon(Icons.logout, color: Colors.black),
            ),
          ],
        ),
      ),
    );

Widget buildHeader({
  required String image,
  required String name,
  required VoidCallback onClicked,
}) =>
    InkWell(
      onTap: onClicked,
      child: Container(
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              child: Image.asset('assets/images/Logo Icono.png'),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ],
            ),
          ],
        ),
      ),
    );

Widget buildSearchField() {
  final color = Colors.black;

  return TextField(
    style: TextStyle(color: color),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: 'Search',
      hintStyle: TextStyle(color: color),
      prefixIcon: Icon(Icons.search, color: color),
      filled: true,
      fillColor: Colors.white12,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
    ),
  );
}
