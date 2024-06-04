import 'package:clickandcut_admin/Screens/HomePage/offerPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat for date formatting

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _bookings = '10'; // Initial booking count
  String _revenue = '\₹ 500'; // Initial revenue
  String _selectedBookingOption = 'All'; // Initially selected booking option
  String _selectedRevenueOption = 'Today'; // Initially selected revenue option

  // Function to update bookings and selected option
  void updateBooking(String option, String bookings) {
    setState(() {
      _selectedBookingOption = option;
      _bookings = bookings;
    });
  }

  // Function to update revenue and selected option
  void updateRevenue(String option, String revenue) {
    setState(() {
      _selectedRevenueOption = option;
      _revenue = revenue;
    });
  }

  void _showAlertMenu(BuildContext context) {
    DateTime? _selectedStartDate; // Store selected start date
    DateTime? _selectedEndDate; // Store selected end date

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                height: 250, // Adjusted height to fit content
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            final DateTime? pickedStartDate = await _selectDate(context);
                            if (pickedStartDate != null) {
                              setState(() {
                                _selectedStartDate = pickedStartDate;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                            child: Text(_selectedStartDate != null
                                ? DateFormat('yyyy-MM-dd').format(_selectedStartDate!) // Format date
                                : 'Start Date'),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final DateTime? pickedEndDate = await _selectDate(context);
                            if (pickedEndDate != null) {
                              setState(() {
                                _selectedEndDate = pickedEndDate;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                            child: Text(_selectedEndDate != null
                                ? DateFormat('yyyy-MM-dd').format(_selectedEndDate!) // Format date
                                : 'End Date'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        // Perform search or filter logic with selected dates
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 35),
                      ),
                      child: Text('Search'),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Function to show date picker
  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 227, 227),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Bookings Section
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Bookings",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                _bookings,
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        buildBookingOptions(),
                      ],
                    ),
                    // SizedBox(width: 2), 
                    // Revenue Section
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Revenue",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                _revenue,
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        buildRevenueOptions(),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height:100,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              "Update your timeline! ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              "Manage your bookings,breaks,holidays.... ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  // onTap: () {
                  //   Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(builder: (context) => OfferScreen()),
                  // );
                  // },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      height:100,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[100],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.purple[300],
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                "Create your offers! ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                "Create your own offers for the users... ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //      // Show the alert dialog for custom date range selection
      //   },
      //   backgroundColor: Colors.purple,
      //   child: Icon(Icons.add),
      // ),
    );
  }

  Widget buildBookingOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 170,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            buildBookingOption("All"),
            buildDivider(),
            buildBookingOption("Chair 1"),
            buildDivider(),
            buildBookingOption("Chair 2"),
            buildDivider(),
            buildBookingOption("Chair 3"),
          ],
        ),
      ),
    );
  }

  Widget buildBookingOption(String option) {
    return InkWell(
      onTap: () {
        String bookings = '10'; // Default value
        if (option == "All") {
          bookings = '15'; // Example value for "All"
        } else if (option == "Chair 1") {
          bookings = '5'; // Example value for "Chair 1"
        } else if (option == "Chair 2") {
          bookings = '8'; // Example value for "Chair 2"
        } else if (option == "Chair 3") {
          bookings = '2'; // Example value for "Chair 3"
        }
        updateBooking(option, bookings);
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          option,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _selectedBookingOption == option ? Colors.deepPurple : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildRevenueOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 170,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            buildRevenueOption("Today"),
            buildDivider(),
            buildRevenueOption("Last 7 days"),
            buildDivider(),
            buildRevenueOption("Last 1 month"),
            buildDivider(),
            buildRevenueOption("Custom Date"),
          ],
        ),
      ),
    );
  }

  Widget buildRevenueOption(String option) {
    return InkWell(
      onTap: () {
        String revenue = '\₹500'; // Default value
        if (option == "Today") {
          revenue = '\₹600'; // Example value for "Today"
        } else if (option == "Last 7 days") {
          revenue = '\₹800'; // Example value for "Last 7 days"
        } else if (option == "Last 1 month") {
          revenue = '\₹1200'; // Example value for "Last 1 month"
        } else if (option == "Custom Date") {
          revenue = '\₹1000'; // Example value for "Custom Date"
          _showAlertMenu(context); // Show the custom date range selection dialog
        }
        updateRevenue(option, revenue);
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          option,
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _selectedRevenueOption == option ? Colors.deepPurple : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: Colors.black,
    );
  }
}
