import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDate = DateTime.now();
  int _selectedDayIndex = DateTime.now().weekday - 1; // 0 for Monday, ..., 6 for Sunday

  final List<String> _daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _selectedDayIndex = date.weekday - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DateSection(
              selectedDate: _selectedDate,
              onSelectDate: _selectDate,
            ),
            const SizedBox(height: 16),
            DaysSection(
              selectedDayIndex: _selectedDayIndex,
              onSelectDay: (index) {
                setState(() {
                  _selectedDayIndex = index;
                  _selectedDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1 - index));
                });
              },
            ),
            const SizedBox(height: 16),
            const ChairsHeader(),
            const SizedBox(height: 16),
            Expanded(
              child: TimelineSection(
                selectedDay: _daysOfWeek[_selectedDayIndex],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class DateSection extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onSelectDate;

  const DateSection({
    required this.selectedDate,
    required this.onSelectDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
            );
            if (picked != null && picked != selectedDate) {
              onSelectDate(picked);
            }
          },
          child: Text(
            DateFormat('MMMM dd').format(selectedDate),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Text(
          '3 bookings today', // Replace with actual logic for bookings count
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class DaysSection extends StatelessWidget {
  final int selectedDayIndex;
  final ValueChanged<int> onSelectDay;

  const DaysSection({
    required this.selectedDayIndex,
    required this.onSelectDay,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        return GestureDetector(
          onTap: () {
            onSelectDay(index);
          },
          child: Column(
            children: [
              Text(
                ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
                style: TextStyle(
                  fontSize: 16,
                  color: index == selectedDayIndex ? Colors.red : Colors.grey, // Highlight selected day
                ),
              ),
              if (index == selectedDayIndex)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}

class ChairsHeader extends StatelessWidget {
  const ChairsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        SizedBox(width: 35),
        Text('Chair 1', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Text('Chair 2', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Text('Chair 3', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class TimelineSection extends StatelessWidget {
  final String selectedDay;

  const TimelineSection({
    required this.selectedDay,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bookings = _bookings[selectedDay] ?? [];

    return ListView.builder(
      itemCount: _timeSlots.length,
      itemBuilder: (context, index) {
        String time = _timeSlots[index];
        List<Map<String, dynamic>> bookingsForTimeSlot = bookings.where((booking) {
          // Filter bookings that match the current time slot
          DateTime startTime = booking['start'];
          String formattedStartTime = DateFormat('hh:mm a').format(startTime);
          return formattedStartTime == time;
        }).toList();

        return Column(
          children: [
            TimeSlotRow(
              time: time,
              bookings: bookingsForTimeSlot,
            ),
            const SizedBox(height: 8), // Add spacing between each time slot
          ],
        );
      },
    );
  }
}

class TimeSlotRow extends StatelessWidget {
  final String time;
  final List<Map<String, dynamic>> bookings;

  const TimeSlotRow({
    required this.time,
    required this.bookings,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(time),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              Map<String, dynamic>? booking = bookings.firstWhere(
                (booking) => booking['chair'] == index + 1,
                orElse: () => {'start': null, 'end': null, 'chair': null},
              );

              if (booking['start'] != null) {
              return  Container(
  width: 80,
  height: 40,
  margin: const EdgeInsets.all(4.0),
  decoration: BoxDecoration(
    color: Colors.yellow,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.black,
          backgroundImage:AssetImage('assets/bride.png'), // Provide a default image asset
        ),
        const SizedBox(width:5),
        Text(
          booking['name'] ?? 'Luffy', // Provide a default name if 'name' is null
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  ),
);


              } else {
                return Container(
                  width: 80,
                  height: 40, // Default height for an empty slot
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

const List<String> _timeSlots = [
  '08:00 AM', '08:15 AM', '08:30 AM', '08:45 AM', '09:00 AM', '09:15 AM', '09:30 AM', '09:45 AM',
  '10:00 AM', '10:15 AM', '10:30 AM', '10:45 AM', '11:00 AM', '11:15 AM', '11:30 AM', '11:45 AM',
  '12:00 PM', '12:15 PM', '12:30 PM', '12:45 PM', '01:00 PM', '01:15 PM', '01:30 PM', '01:45 PM',
  '02:00 PM', '02:15 PM', '02:30 PM', '02:45 PM', '03:00 PM', '03:15 PM', '03:30 PM', '03:45 PM',
  '04:00 PM', '04:15 PM', '04:30 PM', '04:45 PM', '05:00 PM', '05:15 PM', '05:30 PM', '05:45 PM',
  '06:00 PM', '06:15 PM', '06:30 PM', '06:45 PM', '07:00 PM', '07:15 PM', '07:30 PM', '07:45 PM',
  '08:00 PM', '08:15 PM', '08:30 PM',  '08:45 PM', '09:00 PM', '09:15 PM', '09:30 PM', '09:45 PM', '10:00 PM',
];

final Map<String, List<Map<String, dynamic>>> _bookings = {
  'Mon': [
    {'start': DateTime(2024, 6, 3, 8, 0), 'end': DateTime(2024, 6, 3, 8, 30), 'chair': 1},
    {'start': DateTime(2024, 6, 3, 9, 0), 'end': DateTime(2024, 6, 3, 9, 30), 'chair': 2},
    {'start': DateTime(2024, 6, 3, 14, 0), 'end': DateTime(2024, 6, 3, 15, 0), 'chair': 3},
  ],
  'Tue': [
    {'start': DateTime(2024, 6, 4, 8, 0), 'end': DateTime(2024, 6, 4, 9, 0), 'chair': 1},
    {'start': DateTime(2024, 6, 4, 11, 0), 'end': DateTime(2024, 6, 4, 12, 0), 'chair': 2},
    {'start': DateTime(2024, 6, 4, 14, 0), 'end': DateTime(2024, 6, 4, 15, 0), 'chair': 3},
  ],
  'Wed': [
    {'start': DateTime(2024, 6, 5, 9, 0), 'end': DateTime(2024, 6, 5, 10, 0), 'chair': 1},
    {'start': DateTime(2024, 6, 5, 11, 0), 'end': DateTime(2024, 6, 5, 12, 0), 'chair': 2},
    {'start': DateTime(2024, 6, 5, 14, 0), 'end': DateTime(2024, 6, 5, 15, 0), 'chair': 3},
  ],
  'Thu': [
    {'start': DateTime(2024, 6, 6, 10, 0), 'end': DateTime(2024, 6, 6, 11, 0), 'chair': 1},
    {'start': DateTime(2024, 6, 6, 12, 0), 'end': DateTime(2024, 6, 6, 13, 0), 'chair': 2},
    {'start': DateTime(2024, 6, 6, 14, 0), 'end': DateTime(2024, 6, 6, 15, 0), 'chair': 3},
  ],
  'Fri': [
    {'start': DateTime(2024, 6, 7, 9, 0), 'end': DateTime(2024, 6, 7, 10, 0), 'chair': 1},
    {'start': DateTime(2024, 6, 7, 11, 0), 'end': DateTime(2024, 6, 7, 12, 0), 'chair': 2},
    {'start': DateTime(2024, 6, 7, 14, 0), 'end': DateTime(2024, 6, 7, 15, 0), 'chair': 3},
  ],
  'Sat': [
    {'start': DateTime(2024, 6, 8, 10, 0), 'end': DateTime(2024, 6, 8, 11, 0), 'chair': 1},
    {'start': DateTime(2024, 6, 8, 12, 0), 'end': DateTime(2024, 6, 8, 13, 0), 'chair': 2},
    {'start': DateTime(2024, 6, 8, 14, 0), 'end': DateTime(2024, 6, 8, 15, 0), 'chair': 3},
  ],
  'Sun': [
    {'start': DateTime(2024, 6, 9, 9, 0), 'end': DateTime(2024, 6, 9, 10, 0), 'chair': 1},
    {'start': DateTime(2024, 6, 9, 11, 0), 'end': DateTime(2024, 6, 9, 12, 0), 'chair': 2},
    {'start': DateTime(2024, 6, 9, 14, 0), 'end': DateTime(2024, 6, 9, 15, 0), 'chair': 3},
  ],
};



