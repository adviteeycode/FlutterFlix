import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterflix/screens/detail_screen.dart';
import 'package:flutterflix/constants/constant.dart';

class TrendingSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CarouselSlider.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(movie: snapshot.data[itemIndex])));
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        '$imageUrlPath${snapshot.data[itemIndex].posterPath}'),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.55,
            aspectRatio: 1.1,
            enlargeCenterPage: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          )),
    );
  }
}
