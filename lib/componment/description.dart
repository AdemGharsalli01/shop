import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shop/share/app_colors.dart';

// nzid implements PreferredSizeWidget bech nejm nesta3ml el fichier ka app bar 
class Description extends StatelessWidget implements PreferredSizeWidget {
  const Description({super.key});

// ne3mlou override lel preferred size bech n7otou taille mta3 el app bar
 @override
  Size get preferredSize => const Size.fromHeight(400);

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(color: app_colors.secondarycolor),
        height: 400,
        child: Column(
          children: [
            Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Ionicons.logo_facebook, color: Colors.blue, size: 30),
                Gap(10),
                Icon(Ionicons.logo_tiktok, color: Colors.black, size: 30),
                Gap(10),
                Icon(Ionicons.logo_instagram, color: Colors.red, size: 30),
              ],
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  height: 2,
                  width: 100,
                ),
                Icon(Icons.star_purple500_rounded),
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  height: 2,
                  width: 100,
                ),
              ],
            ),
            Gap(25),
            Text(
              "  old money clothes  \n  premium brand  \n  luxury clothes \n contact us : 27 977 354",

              textAlign: TextAlign.center,
              style: TextStyle(color: app_colors.primarycolor, fontSize: 20),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey.shade600),
                  height: 2,
                  width: 100,
                ),
              ],
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("about", style: TextStyle(fontSize: 20)),
                Gap(20),
                Text("contact", style: TextStyle(fontSize: 20)),
                Gap(20),
                Text("help", style: TextStyle(fontSize: 20)),
              ],
            ),
            Gap(10),
            Container(
              decoration: BoxDecoration(color: Colors.grey.shade600),
              height: 90,
              width: double.infinity,
              child: Center(
                child: Text(
                  "© 2025 old money clothes",
                  style: TextStyle(
                    color: app_colors.primarycolor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
  
 
  

}
