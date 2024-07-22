import 'package:flutter/material.dart';
import 'package:spotify_app/gen/assets.gen.dart';
import 'package:spotify_app/gen/fonts.gen.dart';
import '../component/search_field_component.dart';
import '../constant/app_colors.dart';

class ChoosePodcastScreen extends StatefulWidget {
  const ChoosePodcastScreen({super.key});

  @override
  State<ChoosePodcastScreen> createState() => _ChoosePodcastScreenState();
}

class _ChoosePodcastScreenState extends State<ChoosePodcastScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> podcastImage = [
    Assets.img.podcastImg.p1.path,
    Assets.img.podcastImg.p2.path,
    Assets.img.podcastImg.p3.path,
    Assets.img.podcastImg.p4.path,
    Assets.img.podcastImg.p5.path,
    Assets.img.podcastImg.p6.path,
    Assets.img.podcastImg.p7.path,
    Assets.img.podcastImg.p8.path,
    Assets.img.podcastImg.p9.path,
    Assets.img.podcastImg.p10.path,
  ];
  List<String> podcastName = [
    'The Joy Rogan',
    'Casefile',
    'Hot Mess',
    'Acquired',
    'Spiritual Hustler',
    'Crime Junkie',
    'Dateline',
    'Call her Daddy',
    'Phil in the Blanks',
    'Fantasy Footballers'
  ];

  List<String> filteredPodcastName = [];
  List<String> filteredPodcastImage = [];

  void filterPodcast() {
    String query = searchController.text.toLowerCase();
    setState(() {
      if (query.isNotEmpty) {
        filteredPodcastName = podcastName
            .where((name) => name.toLowerCase().contains(query))
            .toList();

        filteredPodcastImage = podcastImage
            .where((image) => podcastName[podcastImage.indexOf(image)]
                .toLowerCase()
                .contains(query))
            .toList();
      } else {
        filteredPodcastImage = podcastImage;
        filteredPodcastName = podcastName;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredPodcastName = podcastName;
    filteredPodcastImage = podcastImage;

    searchController.addListener(
      () {
        filterPodcast();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 35, left: 15),
              child: Text(
                'Now choose some\npodcasts.',
                style: TextStyle(
                    fontFamily: FontFamily.avenirBold,
                    fontSize: 30,
                    color: AppColors.textColorWhite),
              ),
            ),
            SearchFieldComponent(searchController: searchController),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: filteredPodcastName.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 15,
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            filteredPodcastImage[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text(
                              filteredPodcastName[index],
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
