import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyBookingScreen extends StatefulWidget {
  @override
  _MyBookingScreenState createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Bookings",
          style: TextStyle(
            fontSize: 20,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [
                  Color(0xFF6f4fc1),
                  Color(0xFF904088),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Upcoming Bookings Tab
          ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              SalonBookingCard(
                salonName: 'Sample Salon 1',
                date: DateTime.now().add(Duration(days: 1)),
                fromTime: TimeOfDay(hour: 10, minute: 0),
                toTime: TimeOfDay(hour: 12, minute: 0),
                totalPrice: 100.0,
              ),
              SalonBookingCard(
                salonName: 'Sample Salon 2',
                date: DateTime.now().add(Duration(days: 2)),
                fromTime: TimeOfDay(hour: 14, minute: 0),
                toTime: TimeOfDay(hour: 16, minute: 0),
                totalPrice: 120.0,
              ),
            ],
          ),

          // Past Bookings Tab
          Container(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text('No Past Bookings'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text('Cancelled Bookings'),
            ),
          ),
        ],
      ),
    );
  }
}

class SalonBookingCard extends StatelessWidget {
  final String salonName;
  final DateTime date;
  final TimeOfDay fromTime;
  final TimeOfDay toTime;
  final double totalPrice;

  const SalonBookingCard({
    Key? key,
    required this.salonName,
    required this.date,
    required this.fromTime,
    required this.toTime,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Salon Name: $salonName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Date: ${DateFormat.yMMMd().format(date)}'),
            SizedBox(height: 4.0),
            Text(
                'Time: ${fromTime.format(context)} - ${toTime.format(context)}'),
            SizedBox(height: 4.0),
            Text('Total Price: \$${totalPrice.toStringAsFixed(2)}'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildServiceContainer(Icons.content_cut, 'Haircut'),
                _buildServiceContainer(Icons.shower, 'Shave'),
                _buildServiceContainer(Icons.spa, 'Massage'),
                _buildServiceContainer(Icons.face, 'Facial'),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    // Add functionality for rescheduling
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceContainer(IconData icon, String label) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), border: Border.all()),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 15),
            SizedBox(height: 3.0),
            Text(
              label,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
