import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clickandcut_admin/Providers/SelectedServicesProvider.dart';
import 'package:clickandcut_admin/Models/Services.dart';

class ServiceCostAndTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Services>? selectedServices =
        Provider.of<SelectedServicesProvider>(context).selectedServices;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Services Cost & Time',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            selectedServices != null && selectedServices.isNotEmpty
                ? Column(
                    children: selectedServices
                        .map((service) => ServiceInputFields(service: service))
                        .toList(),
                  )
                : Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/empty-folder.png', // Path to your null image asset
                          height: 200, // Adjust height as needed
                        ),
                        Text(
                          "Services Not Selected!",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class ServiceInputFields extends StatefulWidget {
  final Services service;

  const ServiceInputFields({required this.service, Key? key}) : super(key: key);

  @override
  _ServiceInputFieldsState createState() => _ServiceInputFieldsState();
}

class _ServiceInputFieldsState extends State<ServiceInputFields> {
  late double _price;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _price = widget.service.price;
    _duration = widget.service.duration;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.service.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 40,
                      width: 200,
                      child: TextFormField(
                        initialValue: _price.toString(),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Enter price',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _price = double.tryParse(value) ?? 0.0;
                            widget.service.price = _price; // Update the price in the service object
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Duration',
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    Container(
                      child: DurationPicker(
                        duration: _duration,
                        onChanged: (newDuration) {
                          setState(() {
                            _duration = newDuration;
                            widget.service.duration = _duration; // Update the duration in the service object
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                Provider.of<SelectedServicesProvider>(context, listen: false).removeService(widget.service);
              },
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DurationPicker extends StatefulWidget {
  final Duration duration;
  final ValueChanged<Duration> onChanged;

  const DurationPicker({
    required this.duration,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _DurationPickerState createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late int _minutes;

  @override
  void initState() {
    super.initState();
    _minutes = widget.duration.inMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              _minutes = (_minutes - 5).clamp(0, _minutes);
              widget.onChanged(Duration(minutes: _minutes));
            });
          },
        ),
        Text('$_minutes min'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _minutes = (_minutes + 5).clamp(_minutes, _minutes + 5);
              widget.onChanged(Duration(minutes: _minutes));
            });
          },
        ),
      ],
    );
  }
}
