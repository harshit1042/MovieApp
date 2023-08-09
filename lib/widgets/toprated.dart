import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Toprated Movies",
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: toprated[index]["title"],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                toprated[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                toprated[index]['poster_path'],
                            description: toprated[index]['overview'],
                            vote: toprated[index]['vote_average'].toString(),
                            launch_on: toprated[index]['release_date'],
                          ),
                        ),
                      );
                    },
                    child: toprated[index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path']),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: modified_text(
                                      text:
                                          toprated[index]['title'] ?? 'Loading',
                                      size: 10,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
