import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/custom_listTile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kappBarColorlight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kappBarColorlight,
        title: const Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 120,
                  color: AppColors.kappBarColorlight,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 1000,
                  decoration: const BoxDecoration(
                      color: AppColors.kwhiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 50,
                              )),
                          Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  children: const [
                                    Text("Deepak Kumar"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("deepakdev23@mailinator.com"),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      const CustomListTile(
                          title: "My Profile",
                          leadingIcon: Icons.local_grocery_store),
                      const Divider(),
                      const CustomListTile(
                          title: "My Delivery Address",
                          leadingIcon: Icons.location_on),
                      const Divider(),
                      const CustomListTile(
                          title: "Refer And Earn",
                          leadingIcon: Icons.person_2_outlined),
                      const Divider(),
                      const CustomListTile(
                          title: "Terms & Conditions", leadingIcon: Icons.copy),
                      const Divider(),
                      const CustomListTile(
                          title: "Privacy & Policy", leadingIcon: Icons.security),
                      const Divider(),
                      const CustomListTile(
                          title: "About",
                          leadingIcon: Icons.medical_information_outlined),
                      const Divider(),
                      const CustomListTile(
                          title: "Log Out", leadingIcon: Icons.logout),
                    ],
                  ),
                ),
              ],
            ),
             const Positioned(
                  left:70,
                  top:85,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/userimage.png'),
                    radius: 50,
                  ),
                )
          ],
        ),
      ),
    );
  }
}
