import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerURL,
    required this.posterURL,
    required this.vote,
    required this.launch_on,
  }) : super(key: key);

  final String name, description, bannerURL, posterURL, vote, launch_on;
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
                        bannerURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: modifiedText(
                      text: '  ⭐ Average rating will be :' + vote,
                      size: 18,
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
              child: modifiedText(
                text: name != null ? name : 'Not loaded',
                size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modifiedText(
                text: 'Releasing On - ' + launch_on,
                size: 14,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 200,
                    width: 100,
                    child: Image.network(posterURL),
                  ),
                  Expanded(
                    child: Container(
                      child: modifiedText(
                        text: description,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                  // Respond to button press
                },
                child: Icon(
                  Icons.arrow_back_sharp,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
