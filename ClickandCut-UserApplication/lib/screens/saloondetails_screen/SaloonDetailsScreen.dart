import 'package:click_and_cut/const.dart';
import 'package:click_and_cut/models/salon.dart';
import 'package:click_and_cut/screens/saloondetails_screen/Widgets/Carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/Appbar.dart';
import 'Widgets/Booknowbutton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../const.dart';

class SaloonDetailsPage extends StatefulWidget {
  final Salon data;

  const SaloonDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<SaloonDetailsPage> createState() => _SaloonDetailsPageState();
}

class _SaloonDetailsPageState extends State<SaloonDetailsPage> {
  double rating = 0.0; // Default rating
  List<String> services = ["Haircut", "Shave", "Oil\nMassage", "Ball\nmassage"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(kbgwhite),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 2,
          title: Appbar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Carousel_slider(widget.data.image),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildActionIcon(Icons.call),
                    SizedBox(width: 10),
                    _buildActionIcon(Icons.favorite_outline),
                    SizedBox(width: 10),
                    _buildActionIcon(Icons.share),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  widget.data.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 8),
                _buildDetailRow(
                  icon: FontAwesomeIcons.clock,
                  text: widget.data.time,
                ),
                SizedBox(height: 8),
                _buildDetailRow(
                    icon: Icons.location_on, text: widget.data.area),
                SizedBox(height: 16),
                _buildElevatedButton(
                  onPressed: () {},
                  icon: Icons.location_pin,
                  label: "Show in Map",
                ),
                SizedBox(height: 16),
                Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 0.5,
                  ),
                ),
                _buildDivider(),
                SizedBox(
                  height: 16,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ServiceItem(service: services[index]);
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          letterSpacing: 0.5,
                        ),
                      ),
                      _buildDivider(),
                    ],
                  ),
                ),

                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at sagittis ante. Nulla facilisi. Ut eu mollis purus. Vestibulum nec eleifend lectus. Maecenas at lectus tellus. Mauris posuere justo in quam laoreet, eget egestas nulla tristique. Integer at ex mi. Donec non placerat purus, vitae dapibus lorem. Phasellus in nulla vel sem lacinia luctus vitae eget nunc.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                RateNowContainer(),

                // _buildDivider(),
                // SizedBox(height: 16),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     _buildRatingBar(),
                //     Text(
                //       "Rate now",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 16),
                // _buildDivider(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Booknow_Button(),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon) {
    return Material(
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
          child: Icon(icon, size: 20),
        ),
      ),
    );
  }

  Widget _buildDetailRow({required IconData icon, required String text}) {
    return Row(
      children: [
        FaIcon(icon, size: 15),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildElevatedButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return Container(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon,
            color: Color(klightpurple)), // Icon color matches border color
        label: Text(
          label,
          style: TextStyle(
            color: Color(klightpurple), // Text color matches border color
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingBar() {
    return GestureDetector(
      onTapDown: (details) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final double tapPosition = box.globalToLocal(details.globalPosition).dx;
        final double itemSize = box.size.width / 5;
        int newRating = (tapPosition / itemSize).ceil();
        newRating = newRating.clamp(1, 5);

        setState(() {
          rating = newRating.toDouble();
        });
      },
      child: RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        direction: Axis.horizontal,
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
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    );
  }
}

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final double size;
  final Color color;
  final Function(int)? onRatingChanged;

  const StarRating({
    this.starCount = 5,
    this.rating = 0.0,
    this.size = 30.0,
    this.color = const Color(0xFF6f4fc1),
    this.onRatingChanged,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () {
            final newRating = index + 1.0;
            setState(() {
              _rating = newRating;
            });
            if (widget.onRatingChanged != null) {
              widget.onRatingChanged!(newRating.toInt());
            }
          },
          child: Icon(
            index < _rating.floor()
                ? Icons.star
                : index + 0.5 == _rating
                    ? Icons.star_half
                    : Icons.star_border,
            size: widget.size,
            color: widget.color,
          ),
        );
      }),
    );
  }
}

class RateNowContainer extends StatelessWidget {
  final Color klightpurple = const Color(0xFF6f4fc1);
  final Color kdarkpurple = const Color(0xFF904088);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Rate and Review",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: StarRating(
              starCount: 5,
              rating: 0,
              size: 40.0,
              color: klightpurple,
              onRatingChanged: (rating) {
                // Implement your logic here when the rating changes
                print('Rating: $rating');
              },
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write your review here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                // Implement your logic here for posting the review
                print('Post button pressed');
              },
              child: Text(
                'Post',
                style: TextStyle(
                  color: klightpurple,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class ServiceItem extends StatefulWidget {
  final String service;
  const ServiceItem({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected ? Color(klightpurple) : Colors.transparent,
          border: Border.all(
            color: isSelected ? Color(klightpurple) : Colors.black,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            widget.service,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
