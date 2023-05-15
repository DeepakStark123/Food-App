import 'package:flutter/material.dart';
import 'package:food_app/modules/home/profile/my_profile.dart';
import 'package:food_app/modules/products/review_cart/review_cart.dart';
import 'package:food_app/modules/products/wishlist/wish_list.dart';
import 'package:food_app/widgets/custom_listTile.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/userimage.png'),
                  radius: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Welcome Guest"),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
              child: Column(
            children: [
              const CustomListTile(title: "Home", leadingIcon: Icons.home),
              CustomListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  title: "My Profile",
                  leadingIcon: Icons.person),
              CustomListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReviwCart(),
                        ));
                  },
                  title: "Review Cart",
                  leadingIcon: Icons.card_travel),
              CustomListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WishList()));
                  },
                  title: "My WishList",
                  leadingIcon: Icons.favorite),
            ],
          ))
        ],
      ),
    );
  }
}
