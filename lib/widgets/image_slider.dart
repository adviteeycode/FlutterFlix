import 'package:flutter/material.dart';
import 'package:flutterflix/constants/constant.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, itemIndex) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      '$imageUrlPath${snapshot.data[itemIndex].filePath}',
                    ),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  )),
            );
          }),
    );
  }
}
