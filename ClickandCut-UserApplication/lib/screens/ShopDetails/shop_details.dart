import 'package:click_and_cut/const.dart';
import 'package:click_and_cut/models/salon.dart';
import 'package:click_and_cut/screens/ShopDetails/Components/carousel.dart';
import 'package:click_and_cut/screens/ShopDetails/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/Appbar.dart';
import 'Components/booknow_button.dart';

class ShopDetails extends StatefulWidget {
  final Salon data;

  const ShopDetails({Key? key, required this.data}) : super(key: key);

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  double rating = 0.0; // Default rating
  List<String> services = [
    "Haircut",
    "Shave",
    "Trim",
  ];
  List<String> extraServices = [];
  List<String> selectedServices = [];
  List<String> selectedExtraServices = [];
  int totalServicesAdded = 0;
  void updateExtraServices(List<String> services) {
    setState(() {
      extraServices = services;
    });
  }

  void updateselectedServices(String serviceName) {
    setState(() {
      if (selectedServices.contains(serviceName)) {
        selectedServices.remove(serviceName);
      } else {
        selectedServices.add(serviceName);
      }
    });
  }

  void updateExtraSelectedServices(String serviceName) {
    setState(() {
      if (selectedExtraServices.contains(serviceName)) {
        selectedExtraServices.remove(serviceName);
      } else {
        selectedExtraServices.add(serviceName);
      }
    });
  }

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
              _buildDetailRow(icon: Icons.location_on, text: widget.data.area),
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
                itemCount: services.length + extraServices.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == services.length + extraServices.length)
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShopServices(
                            updateExtraServices: updateExtraServices,
                            selectedExtraServices: selectedExtraServices,
                            updateExtraSelectedServices:
                                updateExtraSelectedServices,
                          ),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add, // The icon you want to display
                                size: 24.0,
                                color: Colors.black,
                              ),
                              SizedBox(
                                  height:
                                      4.0), // Space between the icon and text
                              Text(
                                'Add More',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  else
                    return ServiceItem(
                      service: index < 3
                          ? services[index]
                          : extraServices[index - 3],
                      selectedServices:
                          index < 3 ? selectedServices : selectedExtraServices,
                      updateselectedServices: index < 3
                          ? updateselectedServices
                          : updateExtraSelectedServices,
                    );
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selectedServices.length + selectedExtraServices.length > 0)
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Service Added - ' +
                              '${selectedServices.length + selectedExtraServices.length}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Amount: '),
                                Text(
                                  '\$100', // Your amount text here
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time, // Icon for estimated time
                                  size: 20.0,
                                ),
                                Text(
                                  '1 hour', // Your estimated time text here
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          else
            Container(),
          BookNowButton(),
        ],
      ),
    ));
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
  final List<String> selectedServices;
  final Function(String) updateselectedServices;
  const ServiceItem({
    Key? key,
    required this.service,
    required this.selectedServices,
    required this.updateselectedServices,
  }) : super(key: key);

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  late bool isSelected;
  void toggleServiceSelection(String serviceName) {
    widget.updateselectedServices(serviceName);
    print('${widget.selectedServices}');
  }

  void initState() {
    super.initState();
    isSelected = widget.selectedServices.contains(widget.service);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          toggleServiceSelection(widget.service);
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
