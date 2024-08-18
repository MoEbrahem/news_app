// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/Model/newsSources.dart';
import 'package:news_app/constants/AppColor.dart';

class Itemslistsources extends StatelessWidget {
  Sources sources;
  bool isSelected;
  Itemslistsources(
      {super.key, required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          color: isSelected == true
              ? AppColor.primaryLightColor
              : AppColor.transparentColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primaryLightColor)),
      child: Text(
        sources.name ?? "",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isSelected == true
                  ? AppColor.whiteColor
                  : AppColor.primaryLightColor,
            ),
      ),
    );
  }
}
