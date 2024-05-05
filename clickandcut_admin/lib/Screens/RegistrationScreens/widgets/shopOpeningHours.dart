import 'package:flutter/material.dart';

class ShopOpeningHours extends StatefulWidget {
  @override
  State<ShopOpeningHours> createState() => _ShopOpeningHoursState();
}

class _ShopOpeningHoursState extends State<ShopOpeningHours>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isHoliday = false;
  TimeOfDay? openingHoursFrom;
  TimeOfDay? openingHoursTo;
  List<TimeRange> breakTimings = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'Shop Opening Hours',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return DayItem(dayIndex: index);
            },
          ),
        ),
      ],
    );
  }
}

class DayItem extends StatefulWidget {
  final int dayIndex;

  DayItem({required this.dayIndex});

  @override
  _DayItemState createState() => _DayItemState();
}

class _DayItemState extends State<DayItem> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isHoliday = false;
  TimeOfDay? openingHoursFrom;
  TimeOfDay? openingHoursTo;
  List<TimeRange> breakTimings = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getDayName(widget.dayIndex),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Mark as Holiday',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: 10),
                Checkbox(
                  value: isHoliday,
                  onChanged: (value) {
                    setState(() {
                      isHoliday = value!;
                      if (value == true) {
                        // Reset other fields if marked as holiday
                        openingHoursFrom = null;
                        openingHoursTo = null;
                        breakTimings.clear();
                      }
                    });
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            if (!isHoliday) ...[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Opening Hours:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _selectOpeningHours(context),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey[200], // Neutral button color
                      // onPrimary: Colors.black, // Text color
                    ),
                    child: Text(
                      openingHoursFrom != null
                          ? '${_formatTimeOfDay(openingHoursFrom!)}'
                          : 'Start',
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "to",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _selectClosingHours(context),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey[200], // Neutral button color
                      // onPrimary: Colors.black, // Text color
                    ),
                    child: Text(
                      openingHoursTo != null
                          ? '${_formatTimeOfDay(openingHoursTo!)}'
                          : 'End',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              for (var timing in breakTimings) ...[
                Row(
                  children: [
                    Text('Break timing: '),
                    SizedBox(width: 10),
                    Text('${_formatTimeOfDay(timing.start)} - ${_formatTimeOfDay(timing.end)}'),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          breakTimings.remove(timing);
                        });
                      },
                      color: Colors.red, // Clear button color
                    ),
                  ],
                ),
              ],
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _addBreakTiming(context),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.blue[200], // Accent button color
                  // onPrimary: Colors.white, // Text color
                ),
                child: Text('Add Break'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getDayName(int dayIndex) {
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[dayIndex];
  }

  Future<void> _selectOpeningHours(BuildContext context) async {
    final selectedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 9, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Apply light theme for better visibility
          child: child!,
        );
      },
    );
    if (selectedStartTime != null) {
      setState(() {
        openingHoursFrom = selectedStartTime;
      });
    }
  }

  Future<void> _selectClosingHours(BuildContext context) async {
    final selectedEndTime = await showTimePicker(
      context: context,
      initialTime: openingHoursTo ?? TimeOfDay(hour: 21, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Apply light theme for better visibility
          child: child!,
        );
      },
    );
    if (selectedEndTime != null) {
      setState(() {
        openingHoursTo = selectedEndTime;
      });
    }
  }

  void _addBreakTiming(BuildContext context) async {
    TimeOfDay? selectedStartTime;
    TimeOfDay? selectedEndTime;

    // Select start time
    selectedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Use light theme for time picker
          child: child!,
        );
      },
    );

    if (selectedStartTime != null) {
      // Select end time
      selectedEndTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 13, minute: 0),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(), // Use light theme for time picker
            child: child!,
          );
        },
      );

      if (selectedEndTime != null) {
        // Add the break timing
        setState(() {
          breakTimings.add(TimeRange(selectedStartTime!, selectedEndTime!));
        });
      }
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    int hour = time.hourOfPeriod;
    String minute = time.minute.toString().padLeft(2, '0');
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
}

class TimeRange {
  final TimeOfDay start;
  final TimeOfDay end;

  TimeRange(this.start, this.end);
}
