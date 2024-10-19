import 'package:flutter/material.dart';
import 'package:flutterflix/models/movie_model.dart';
import 'package:flutterflix/screens/screenshots.dart';
import 'package:flutterflix/widgets/custom_text.dart';
import 'package:flutterflix/constants/constant.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> genre = [];
  late List<Container> genreContainer;
  @override
  void initState() {
    super.initState();
    for (int genreId in widget.movie.genre) {
      genre.add(movieGenresByCode[genreId].toString());
    }
    genreContainer = genreFun();
  }

  List<Container> genreFun() {
    List<Container> genreContainer = [];
    for (int i = 0; i < genre.length && i < 3; i++) {
      genreContainer.add(Container(
          margin: const EdgeInsets.only(top: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
            child: CustomText(
              data: "@${genre[i]}",
              size: 18,
            ),
          )));
    }
    return genreContainer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            elevation: 100,
            backgroundColor: Colors.amberAccent,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieScreenShots(
                          movieId: widget.movie.movieId,
                          title: widget.movie.title)));
            },
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/playbutton.png'))),
            )),
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              leading: Container(
                margin: const EdgeInsets.only(left: 8, top: 8),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Colors.black, offset: Offset(4, -4))
                  ],
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              expandedHeight: 510,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                  child: Image.network(
                    "$imageUrlPath${widget.movie.posterPath}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(18)),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const CustomText(
                        data: "Title",
                        size: 26,
                        color: Colors.blue,
                      ),
                    ),
                    CustomText(data: widget.movie.title, size: 18),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: const CustomText(
                        data: "Genre",
                        size: 26,
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: genreContainer,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const CustomText(
                        data: "Overview",
                        size: 26,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomText(data: widget.movie.overview, size: 18),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                const CustomText(
                                  data: "Release: ",
                                  size: 22,
                                  color: Colors.blue,
                                ),
                                CustomText(
                                    data: widget.movie.releaseDate, size: 20),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.blueGrey,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                const CustomText(
                                  data: "Rating: ",
                                  size: 22,
                                  color: Colors.blue,
                                ),
                                CustomText(
                                    data:
                                        '${widget.movie.voteAverage.toStringAsFixed(1)}/10',
                                    size: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
