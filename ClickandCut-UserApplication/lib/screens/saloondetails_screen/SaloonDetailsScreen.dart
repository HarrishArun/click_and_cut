import 'package:click_and_cut/const.dart';

import 'package:click_and_cut/screens/saloondetails_screen/Widgets/Carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/Appbar.dart';
import 'Widgets/Booknowbutton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SaloonDetailsPage extends StatefulWidget {
  final List<String> image;

  final String Saloonname;
  final String time;
  final String address;

  SaloonDetailsPage(
    this.image,
    this.Saloonname,
    this.time,
    this.address,
  );

  @override
  State<SaloonDetailsPage> createState() => _SaloonDetailsPageState();
}

class _SaloonDetailsPageState extends State<SaloonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(kbgwhite),
        appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 2,
            title: Appbar()),
        body: Column(
          children: [
            Container(
              color: Color(kbgwhite),
              child: Column(
                children: [
                  //  TutorProfileImage(ProfileImage: _ProfileImage),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 16, 0, 16),
                    child: Carousel_slider(widget.image),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(25),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.call,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(25),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.favorite_outline,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(25),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.share,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.Saloonname,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.clock,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 17,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.address,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(
                                      color: Color(klightpurple),
                                      style: BorderStyle.solid,
                                      width: 1)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 15.0),
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.location_pin),
                            label: Text("Show in Map")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  Container(
                    //   decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20),
                    //color: Colors.white),
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTapDown: (details) {
                              // Calculate the rating based on the tap position
                              final RenderBox box =
                                  context.findRenderObject() as RenderBox;
                              final double tapPosition =
                                  box.globalToLocal(details.globalPosition).dx;
                              final double itemSize =
                                  box.size.width / 5; // Assuming 5 stars
                              int newRating = (tapPosition / itemSize).ceil();

                              // Ensure the new rating is within the range of 1 to 5 stars
                              newRating = newRating.clamp(1, 5);

                              setState(() {
                                rating = newRating.toDouble();
                              });
                            },
                            child: RatingBar.builder(
                              initialRating: rating,
                              minRating: 1, // Minimum rating
                              direction: Axis.horizontal,
                              // /allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 30.0,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {
                                  rating = rating;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            "Rate now",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Booknow_Button(),
      ),
    );
  }
}
