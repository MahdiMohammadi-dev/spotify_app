import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../gen/fonts.gen.dart';

class SearchFieldComponent extends StatelessWidget {
  const SearchFieldComponent({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.textfieldColorGrey,
            ),
            filled: true,
            fillColor: AppColors.textColorWhite,
            hintText: 'Search',
            hintStyle: TextStyle(
                fontFamily: FontFamily.avenirMedium,
                color: AppColors.mainColor)),
      ),
    );
  }
}
