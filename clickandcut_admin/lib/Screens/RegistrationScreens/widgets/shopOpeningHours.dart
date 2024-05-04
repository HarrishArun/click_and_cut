import 'package:flutter/material.dart';

class ShopOpeningHours extends StatefulWidget {
  @override
  State<ShopOpeningHours> createState() => _ShopOpeningHoursState();
}

class _ShopOpeningHoursState extends State<ShopOpeningHours> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 7, // For 7 days of the week
        itemBuilder: (context, index) {
          return DayItem(dayIndex: index);
        },
      ),
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
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, ),
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
                  // Text('Opening Hours:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  // SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _selectOpeningHours(context),
                    child: Text(
                      openingHoursFrom != null
                          ? '${_formatTimeOfDay(openingHoursFrom!)}'
                          : 'Start time',
                          // style: TextStyle(fontSize: 10),
                    ),
                  ),
                  // SizedBox(width: 10),
                  Text("to",style: TextStyle(fontSize: 15),),
                  // SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _selectClosingHours(context),
                    child: Text(
                      openingHoursTo != null
                          ? '${_formatTimeOfDay(openingHoursTo!)}'
                          : 'End time',
                          // style: TextStyle(fontSize: 10),
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
                    ),
                  ],
                ),
              ],
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _addBreakTiming(context),
                child: Text('Add Break',),
                
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
          data: ThemeData.dark(), // Apply dark theme
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
        data: ThemeData.dark(), // Apply dark theme
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
          data: ThemeData.dark(), // Use dark theme for time picker
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
            data: ThemeData.dark(),
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
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class TimeRange {
  final TimeOfDay start;
  final TimeOfDay end;

  TimeRange(this.start, this.end);
}
