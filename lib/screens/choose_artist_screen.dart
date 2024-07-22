import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/component/search_field_component.dart';
import 'package:spotify_app/screens/choose_podcast_screen.dart';

import '../constant/app_colors.dart';
import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';

class ChooseArtistScreen extends StatefulWidget {
  ChooseArtistScreen({super.key});

  @override
  _ChooseArtistScreenState createState() => _ChooseArtistScreenState();
}

class _ChooseArtistScreenState extends State<ChooseArtistScreen> {
  TextEditingController searchController = TextEditingController();

  List<int> selectedArtist = [];

  List<String> artistName = [
    'Homayoun Shajarian',
    'Babak Jahanbakhsh',
    'Reza Sadeghi',
    'Billie Eilish',
    'Kanye West',
    'Ariana Grande',
    'Drake',
    'Enrique Iglesias',
    'Rihanna',
    'Shakira',
    'The Weeknd',
    'Dua Lipa',
  ];

  List<String> artistImage = [
    Assets.img.homayoun.path,
    Assets.img.babak.path,
    Assets.img.reza.path,
    Assets.img.billie.path,
    Assets.img.kanye.path,
    Assets.img.ariana.path,
    Assets.img.drake.path,
    Assets.img.enrique.path,
    Assets.img.rihana.path,
    Assets.img.shakira.path,
    Assets.img.weekend.path,
    Assets.img.dua.path,
  ];

  List<String> filteredArtistName = [];
  List<String> filteredArtistImage = [];

  @override
  void initState() {
    super.initState();
    filteredArtistName = artistName;
    filteredArtistImage = artistImage;

    searchController.addListener(() {
      filterArtists();
    });
  }

  void filterArtists() {
    String query = searchController.text.toLowerCase();
    setState(() {
      if (query.isNotEmpty) {
        filteredArtistName = artistName
            .where((name) => name.toLowerCase().contains(query))
            .toList();

        filteredArtistImage = artistImage
            .where((image) => artistName[artistImage.indexOf(image)]
                .toLowerCase()
                .contains(query))
            .toList();
      } else {
        filteredArtistName = artistName;
        filteredArtistImage = artistImage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.textColorWhite),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'choose 3 or more artists you like.',
            style: TextStyle(
                fontFamily: FontFamily.avenirBold,
                color: AppColors.textColorWhite,
                fontSize: 16),
          ),
        ),
        body: Column(
          children: [
           SearchFieldComponent(searchController: searchController),
            Expanded(
              child: GridView.builder(
                itemCount: filteredArtistName.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 15,
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  final isSelected = selectedArtist.contains(index);
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedArtist.remove(index);
                        } else {
                          selectedArtist.add(index);
                        }
                        if (selectedArtist.length >= 3) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChoosePodcastScreen(),
                          ));
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                          ),
                          foregroundDecoration: BoxDecoration(
                          border: isSelected? Border.all(color: AppColors.greenColor,width: 3):null,
                            borderRadius:isSelected? const BorderRadius.all(Radius.circular(500)):null,

                          ),
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            filteredArtistImage[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text(
                              filteredArtistName[index],
                              style: const TextStyle(
                                  fontFamily: FontFamily.avenirBold,
                                  color: AppColors.textColorWhite),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
