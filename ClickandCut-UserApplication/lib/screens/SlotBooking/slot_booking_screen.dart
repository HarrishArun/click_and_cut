import 'package:click_and_cut/const.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

import '../PaymentConfirmationScreen/PaymentConfirmationScreen.dart';
import 'Model/SlotsData.dart';

class SlotBookingDetailScreen extends StatefulWidget {
  @override
  _SlotBookingDetailScreenState createState() =>
      _SlotBookingDetailScreenState();
}

class _SlotBookingDetailScreenState extends State<SlotBookingDetailScreen> {
  int selectedDayIndex = 0;
  int selectedTimeIndex = -1;
  int duration = 60;

  int selectedChairIndex = -1; // Selected chair index
  DateTime selectedDate = DateTime.now();
  final List<DateTime> pickdate = List.generate(
    30,
    (index) => DateTime.now().subtract(Duration(days: -index)),
  );
  final List<DateSlotData> dates = getDummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text(
            'Saloon name',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.green[100],
                child: Row(
                  children: [
                    Icon(Icons.local_offer, color: Colors.green),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        'Get 25% off upto ₹1600 on all Services on min 2 hours slots',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(klightpurple),
                        boxShadow: [
                          BoxShadow(
                            color: Color(klightpurple).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          child: PageView.builder(
                            controller: PageController(viewportFraction: 0.25),
                            itemCount: pickdate.length,
                            onPageChanged: (index) {
                              setState(() {
                                selectedDayIndex = index % 7;
                                selectedTimeIndex = -1;
                                selectedChairIndex = -1;
                                selectedDate = pickdate[index];
                              });
                            },
                            itemBuilder: (context, index) {
                              DateTime date = pickdate[index];
                              bool isSelected = date.day == selectedDate.day &&
                                  date.month == selectedDate.month &&
                                  date.year == selectedDate.year;

                              return Transform.scale(
                                scale: isSelected ? 1.2 : 1.0,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat('MMM').format(date).substring(
                                            0,
                                            3), // Displaying the first three letters of the month
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: isSelected ? 20 : 16,
                                        ),
                                      ),
                                      Text(
                                        date.day.toString(),
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: isSelected ? 24 : 18,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('EEE').format(date),
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: isSelected ? 20 : 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Available Slots',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // Other style properties
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 24,
                  itemBuilder: (context, index) {
                    final slot = dates[selectedDayIndex].slots[index];
                    return GestureDetector(
                      onTap: slot.available && !slot.full
                          ? () {
                              setState(() {
                                selectedTimeIndex = index;
                                selectedChairIndex = -1;
                              });
                            }
                          : null,
                      child: Container(
                        width: 60.0,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: selectedTimeIndex == index
                              ? Color(klightpurple)
                              : slot.full
                                  ? Colors.red
                                  : slot.available
                                      ? Colors.green
                                      : Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          '${slot.hour}:00',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              selectedTimeIndex != -1 &&
                      dates[selectedDayIndex]
                          .slots[selectedTimeIndex]
                          .available &&
                      !dates[selectedDayIndex].slots[selectedTimeIndex].full
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Chair',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // Other style properties
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Wrap(
                          spacing: 10.0,
                          children: List.generate(3, (index) {
                            return ChoiceChip(
                              label: Text('Chair ${index + 1}'),
                              selected: selectedChairIndex == index,
                              onSelected: (selected) {
                                setState(() {
                                  selectedChairIndex = selected ? index : -1;
                                });
                              },
                            );
                          }),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 16.0),
              SizedBox(height: 8.0),
              Center(
                child: Text(
                  'Wohoo! You can now avail INR 96 OFF 🎉',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SlotBookingDetailScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment
                          .topLeft, // Define the start point of the gradient
                      end: Alignment
                          .bottomRight, // Define the end point of the gradient
                      colors: [
                        Color(klightpurple), // Start color of the gradient
                        Color(kdarkpurple), // End color of the gradient
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                        10), // Add border radius if needed
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )),
                ),
              )),
        ));
  }
}
