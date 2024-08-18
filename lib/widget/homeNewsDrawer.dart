import 'package:flutter/material.dart';
import 'package:news_app/constants/AppColor.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeNewsDrawer extends StatelessWidget {
  Function onDrawerclicked;
  static const int categories = 1;
  static const int settings = 2;
  HomeNewsDrawer({
    super.key,
    required this.onDrawerclicked,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            margin: EdgeInsets.only(bottom: height * 0.03),
            decoration: const BoxDecoration(
              color: AppColor.primaryLightColor,
            ),
            // curve: Curves.bounceIn,
            child: Center(
              child: Text(
                // AppLocalizations.of(context)!.
                "newsApp",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerclicked(categories);
            },
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                Icon(
                  Icons.list,
                  size: width * 0.08,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  // AppLocalizations.of(context)!.
                  "categories"
                  ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              onDrawerclicked(settings);
            },
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                Icon(
                  Icons.settings,
                  size: width * 0.08,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  // AppLocalizations.of(context)!.
                "settings"
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
