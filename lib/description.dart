import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: modified_text(
                      text: ' ⭐ Average Rating - ' + vote,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded',
                  color: Colors.white,
                  size: 20),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                  text: "Releasing On - " + launch_on,
                  color: Colors.white,
                  size: 15),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: modified_text(
                      text: description, color: Colors.white, size: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
