import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/global/global.dart';

import '../authentication/auth_screen.dart';
import '../mainScreens/address_screen.dart';
import '../mainScreens/history_screen.dart';
import '../mainScreens/home_screen.dart';
import '../mainScreens/my_orders_screen.dart';
import '../mainScreens/search_screen.dart';


class MyDrawer extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: ListView(

        children: [
          //header drawer
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 15),
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 160,
                      width: 160,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          sharedPreferences!.getString("photoUrl")!
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Text(
                    sharedPreferences!.getString("name")!,
                  style:  TextStyle(color: Colors.green[900]!, fontSize: 27, fontFamily: "Acme"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25,),

          //body drawer
          Container(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                
                ListTile(
                  leading:  Icon(Icons.home, color: Colors.green[900]!),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.green[900]!),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomeScreen()));
                  },
                ),
                
                ListTile(
                  leading:  Icon(Icons.article_outlined, color: Colors.green[900]!),
                  title: Text(
                    "My Orders",
                    style: TextStyle(color: Colors.green[900]!),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> MyOrdersScreen()));
                  },
                ),
                
                ListTile(
                  leading:  Icon(Icons.access_time, color: Colors.green[900]!),
                  title: Text(
                    "History",
                    style: TextStyle(color: Colors.green[900]!),
                  ),
                  onTap: ()
                  {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> HistoryScreen()));
                  },
                ),
                
                ListTile(
                  leading:  Icon(Icons.search, color: Colors.green[900]!),
                  title: Text(
                    "Search",
                    style: TextStyle(color: Colors.green[900]!),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> SearchScreen()));

                  },
                ),
                
                ListTile(
                  leading:  Icon(Icons.add_location, color: Colors.green[900]!),
                  title: Text(
                    "Add New Address",
                    style: TextStyle(color: Colors.green[900]!),
                  ),
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> AddressScreen()));

                  },
                ),
                ListTile(
                  leading:  Icon(Icons.exit_to_app, color: Colors.green[900]!),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.green[900]!),
                  ),
                  onTap: ()
                  {
                    firebaseAuth.signOut().then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> const AuthScreen()));
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
