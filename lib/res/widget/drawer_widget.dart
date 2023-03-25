import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../utils/theme_provider.dart';
import '../../utils/routes/routes_name.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage('assets/images/logo.png'),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 60,
                      ),
                      IconButton(
                        onPressed: (() {
                          Navigator.pushNamed(context, RoutesName.login);
                        }),
                        icon: const Icon(
                          FontAwesomeIcons.solidUser,
                        ),
                        color: Theme.of(context).primaryColorDark,
                        iconSize: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),

            // Divider(color: Colors.white),
            InkWell(
              child:  ListTile(
                leading: Icon(
                  FontAwesomeIcons.plug,
                 color: Theme.of(context).iconTheme.color,
                  size: 20.0,
                ),
                title: Text(
                  'Energy Data',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.userGroup,
                  color: Theme.of(context).iconTheme.color,
                  size: 15.0,
                ),
                title: Text(
                  'User Management',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child:  ListTile(
                leading: Icon(
                  FontAwesomeIcons.moneyBill,
                  color: Theme.of(context).iconTheme.color,
                  size: 15.0,
                ),
                title: Text(
                  'Manage Subscription',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child:  ListTile(
                leading: Icon(
                  FontAwesomeIcons.fileInvoice,
                  color: Theme.of(context).iconTheme.color,
                  size: 15.0,
                ),
                title: Text(
                  'Billing Details',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child:  ListTile(
                leading: Icon(
                  FontAwesomeIcons.suitcase,
                  color: Theme.of(context).iconTheme.color,
                  size: 15.0,
                ),
                title: Text(
                  'BESS Management',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child:  ListTile(
                leading: Icon(
                  FontAwesomeIcons.leaf,
                  color:Theme.of(context).iconTheme.color,
                  size: 15.0,
                ),
                title: Text(
                  'Carban Footprint',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child:  ListTile(
                leading: Icon(
                  FontAwesomeIcons.gear,
                  color: Theme.of(context).iconTheme.color,
                  size: 15.0,
                ),
                title: Text(
                  'Setting',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.solidBell,
                  color: Theme.of(context).iconTheme.color,
                  size: 15.0,
                ),
                title: Text(
                  'Notification',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: ListTile(
                      leading: Icon(
                        themeProvider.isDarkTheme
                            ? Icons.brightness_3
                            : Icons.brightness_5,
                        color: Theme.of(context).iconTheme.color,
                        size: 15.0,
                      ),
                      title: Text(
                        themeProvider.isDarkTheme ? 'Dark Mode' : 'Light Mode',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    onTap: () {
                      themeProvider.changeTheme();
                    },
                  ),
                ],
              ),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.rightFromBracket,
                  color: Theme.of(context).iconTheme.color,
                  size: 15.0,
                ),
                title: Text(
                  'Logout',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              onTap: () {},
            ),
            Divider(
              color: Theme.of(context).iconTheme.color,
            ),
            ListTile(
                  leading: Text('V1.0', style: TextStyle(color: Theme.of(context).iconTheme.color, fontSize: 36),)
         ,
                 
                ),
             ],
        ),
      ),
    );
  }
}
