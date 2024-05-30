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
