import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Popular TV Shows",
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
                itemCount: tv.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: tv[index]["title"],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['poster_path'],
                            description: tv[index]['overview'],
                            vote: tv[index]['vote_average'].toString(),
                            launch_on: tv[index]['release_date'],
                          ),
                        ),
                      );
                    },
                    child: Container(
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
                                        tv[index]['poster_path']),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: modified_text(
                                text: tv[index]['original_name'] ?? 'Loading',
                                size: 10,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
