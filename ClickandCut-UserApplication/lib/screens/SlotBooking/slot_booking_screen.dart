import 'package:click_and_cut/const.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class SlotBookingDetailScreen extends StatefulWidget {
  @override
  _SlotBookingDetailScreenState createState() =>
      _SlotBookingDetailScreenState();
}

class _SlotBookingDetailScreenState extends State<SlotBookingDetailScreen> {
  int selectedDayIndex = 0; // Index for the selected day in the calendar
  int selectedTimeIndex = -1; // Selected time from the list of slots
  int duration = 60; // Duration in minutes
  String selectedCourt = 'Standard Wooden A/C Court 2'; // Selected court
  int selectedChairIndex = -1; // Selected chair index

  final List<DateSlotData> dates = getDummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Ruckus Herkley'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
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
            // Center(
            //   child: Column(
            //     children: [
            //       Icon(Icons.sports_tennis, size: 50),
            //       Text('Badminton'),
            //     ],
            //   ),
            // ),
            SizedBox(height: 16.0),
            Container(
              height: 100,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.green,
                onDateChange: (date) {
                  setState(() {
                    selectedDayIndex =
                        dates.indexWhere((d) => d.date.day == date.day);
                    selectedTimeIndex = -1;
                    selectedChairIndex = -1;
                  });
                },
                daysCount: 7,
              ),
            ),
            SizedBox(height: 16.0),
            Text('Available Slots'),
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
                            ? Colors.blue
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
                      Text('Select Chair'),
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
            ElevatedButton(
                onPressed: () {
                  // Add your booking logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(kdarkpurple),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Next ->",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
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
    );
  }
}

class DateSlotData {
  final DateTime date;
  final List<TimeSlotData> slots;

  DateSlotData(this.date, this.slots);
}

class TimeSlotData {
  final int hour;
  final bool available;
  final bool full;

  TimeSlotData(this.hour, this.available, this.full);
}

List<DateSlotData> getDummyData() {
  return [
    DateSlotData(
      DateTime.now().add(Duration(days: 0)),
      List.generate(
          24, (index) => TimeSlotData(index, index % 3 == 0, index % 4 == 0)),
    ),
    DateSlotData(
      DateTime.now().add(Duration(days: 1)),
      List.generate(
          24, (index) => TimeSlotData(index, index % 3 != 0, index % 4 != 0)),
    ),
    DateSlotData(
      DateTime.now().add(Duration(days: 2)),
      List.generate(
          24, (index) => TimeSlotData(index, index % 2 == 0, index % 3 == 0)),
    ),
    DateSlotData(
      DateTime.now().add(Duration(days: 3)),
      List.generate(
          24, (index) => TimeSlotData(index, index % 2 != 0, index % 3 != 0)),
    ),
    DateSlotData(
      DateTime.now().add(Duration(days: 4)),
      List.generate(
          24, (index) => TimeSlotData(index, index % 4 == 0, index % 5 == 0)),
    ),
    DateSlotData(
      DateTime.now().add(Duration(days: 5)),
      List.generate(
          24, (index) => TimeSlotData(index, index % 4 != 0, index % 5 != 0)),
    ),
    DateSlotData(
      DateTime.now().add(Duration(days: 6)),
      List.generate(
          24, (index) => TimeSlotData(index, index % 3 == 0, index % 4 == 0)),
    ),
  ];
}
