import 'package:flutter/material.dart';
import 'package:flutterflix/screens/detail_screen.dart';
import 'package:flutterflix/constants/constant.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: snapshot.data.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, itemIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        movie: snapshot.data[itemIndex],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '$imageUrlPath${snapshot.data[itemIndex].posterPath}',
                      ),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
