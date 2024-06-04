import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: EditScreen(),
  ));
}

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            // Custom Tab Bar at the top
            Container(
              margin: EdgeInsets.only(top: 10),
              // Light grey background for aesthetics
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple[100],
              ),
              width: 370,
              height: 40,
              child: TabBar(
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.transparent,
                indicatorWeight: 3.0,
                tabs: [
                  Tab(
                    child: Text(
                      'Shop Hours & Services',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Individual Chairs',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ShopHoursServicesTab(),
                  IndividualChairsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopHoursServicesTab extends StatefulWidget {
  @override
  _ShopHoursServicesTabState createState() => _ShopHoursServicesTabState();
}

class _ShopHoursServicesTabState extends State<ShopHoursServicesTab> {
  List<Service> services = [
    Service(name: 'Haircut', price: 120.0, duration: 20),
    Service(name: 'Clean up', price: 200.0, duration: 45),
    Service(name: 'Manicure', price: 500.0, duration: 60),
  ];

  List<String> chairs = List.generate(3, (index) => 'Chair ${index + 1}');

  List<String> breakTimes = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        // Section 1: Working Time, Break Time
        buildSectionTitle('Working Time'),
        Row(
          children: [
            Expanded(
              child: buildTextField('From', '09:00 AM'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildTextField('To', '06:00 PM'),
            ),
          ],
        ),
        SizedBox(height: 20),
        buildSectionTitle('Break Time'),
        Column(
          children: breakTimes.asMap().entries.map((entry) {
            int index = entry.key;
            String breakTime = entry.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Break ${index + 1}: $breakTime'),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      breakTimes.removeAt(index);
                    });
                  },
                ),
              ],
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () async {
            TimeOfDay? startTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (startTime != null) {
              TimeOfDay? endTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (endTime != null) {
                setState(() {
                  breakTimes.add(
                    '${DateFormat.jm().format(DateTime(0, 0, 0, startTime.hour, startTime.minute))} - ${DateFormat.jm().format(DateTime(0, 0, 0, endTime.hour, endTime.minute))}',
                  );
                });
              }
            }
          },
          icon: Icon(Icons.add, color: Colors.green),
          label: Text(
            'Add Break Time',
            style: TextStyle(color: Colors.green),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: BorderSide(color: Colors.green),
          ),
        ),
        SizedBox(height: 20),
        // Section 2: Holidays
        buildSectionTitle('Holidays'),
        buildTextField('Select Days', 'None'),
        SizedBox(height: 20),
        // Section 3: No. of Chairs Display with delete button
        buildSectionTitle('Chairs'),
        Column(
          children: chairs.asMap().entries.map((entry) {
            int index = entry.key;
            String chair = entry.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(chair),
                ),
                if (index > 0)
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        chairs.removeAt(index);
                      });
                    },
                  ),
              ],
            );
          }).toList(),
        ),
        OutlinedButton.icon(
          onPressed: () {
            setState(() {
              chairs.add('Chair ${chairs.length + 1}');
            });
          },
          icon: Icon(Icons.add, color: Colors.green),
          label: Text('Add Chair', style: TextStyle(color: Colors.green)),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: BorderSide(color: Colors.green),
          ),
        ),
        SizedBox(height: 20),
        // Section 4: Services
        buildSectionTitle('Services'),
        Column(
          children: services.map((service) {
            return buildServiceRow(service);
          }).toList(),
        ),
        SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: () async {
            final newService = await showDialog<Service>(
              context: context,
              builder: (context) {
                return AddServiceDialog();
              },
            );
            if (newService != null) {
              setState(() {
                services.add(newService);
              });
            }
          },
          icon: Icon(Icons.add, color: Colors.green),
          label: Text('Add Service', style: TextStyle(color: Colors.green)),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: BorderSide(color: Colors.green),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle submit logic
          },
          child: Text('Submit'),
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.deepPurple, // Submit button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget buildServiceRow(Service service) {
    return Row(
      children: [
        Expanded(
          child: Text(service.name),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text("\₹" + service.price.toString()),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(service.duration.toString() + " mins"),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              services.remove(service);
            });
          },
        ),
      ],
    );
  }
}



class Service {
  final String name;
  final double price;
  final int duration;

  Service({required this.name, required this.price, required this.duration});
}

class AddServiceDialog extends StatefulWidget {
  @override
  _AddServiceDialogState createState() => _AddServiceDialogState();
}

class _AddServiceDialogState extends State<AddServiceDialog> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  String? selectedService;
  double? price;
  int? duration;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Service'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            items: [
              'Haircut',
              'Cleanup',
              'Manicure',
              'Shave',
              'Bleach',
              'Party makeup',
              'Head massage',
              'Detan',
              'Pedicure',
              'Facial',
              'Hair coloring'
            ].map((service) => DropdownMenuItem<String>(
                  value: service,
                  child: Text(service),
                ))
                .toList(),
            hint: Text('Select Service'),
            onChanged: (value) {
              setState(() {
                selectedService = value;
              });
            },
                      ),
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Price',
            ),
            onChanged: (value) {
              setState(() {
                price = double.tryParse(value);
              });
            },
          ),
          TextField(
            controller: _durationController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Duration (min)',
            ),
            onChanged: (value) {
              setState(() {
                duration = int.tryParse(value);
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: selectedService != null && price != null && duration != null
              ? () {
                  final newService = Service(
                    name: selectedService!,
                    price: price!,
                    duration: duration!,
                  );
                  Navigator.of(context).pop(newService);
                }
              : null,
          child: Text('Add'),
        ),
      ],
    );
  }
}



class IndividualChairsTab extends StatefulWidget {
  @override
  State<IndividualChairsTab> createState() => _IndividualChairsTabState();
}

class _IndividualChairsTabState extends State<IndividualChairsTab> {
  int selectedChairIndex = -1; // Track selected chair index (-1 for none selected)
  List<String> breakTimesIC = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        // Chairs Container with highlighting based on selection
        Container(
          height: 70,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white, // Always white background
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Chair 1
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedChairIndex = 0; // Select Chair 1
                  });
                },
                child: Container(
                  child: Text(
                    "Chair 1",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: selectedChairIndex == 0 ? Colors.purple : Colors.black, // Highlight text if selected
                    ),
                  ),
                ),
              ),
              // Chair 2
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedChairIndex = 1; // Select Chair 2
                  });
                },
                child: Container(
                  child: Text(
                    "Chair 2",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: selectedChairIndex == 1 ? Colors.purple : Colors.black, // Highlight text if selected
                    ),
                  ),
                ),
              ),
              // Chair 3
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedChairIndex = 2; // Select Chair 3
                  });
                },
                child: Container(
                  child: Text(
                    "Chair 3",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: selectedChairIndex == 2 ? Colors.purple : Colors.black, // Highlight text if selected
                    ),
                  ),
                ),
              ),
              // Chair 4
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedChairIndex = 3; // Select Chair 4
                  });
                },
                child: Container(
                  child: Text(
                    "Chair 4",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: selectedChairIndex == 3 ? Colors.purple : Colors.black, // Highlight text if selected
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        // Other Widgets like Working Time, Break Time, Holidays sections remain unchanged
        buildSectionTitleIC('Working Time'),
        Row(
          children: [
            Expanded(
              child: buildTextFieldIC('From', '09:00 AM'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: buildTextFieldIC('To', '06:00 PM'),
            ),
          ],
        ),
        SizedBox(height: 20),
        buildSectionTitleIC('Break Time'),
        Column(
          children: breakTimesIC.asMap().entries.map((entry) {
            int index = entry.key;
            String breakTime = entry.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Break ${index + 1}: $breakTime'),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      breakTimesIC.removeAt(index);
                    });
                  },
                ),
              ],
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () async {
            TimeOfDay? startTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (startTime != null) {
              TimeOfDay? endTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (endTime != null) {
                setState(() {
                  breakTimesIC.add(
                    '${DateFormat.jm().format(DateTime(0, 0, 0, startTime.hour, startTime.minute))} - ${DateFormat.jm().format(DateTime(0, 0, 0, endTime.hour, endTime.minute))}',
                  );
                });
              }
            }
          },
          icon: Icon(Icons.add, color: Colors.green),
          label: Text(
            'Add Break Time',
            style: TextStyle(color: Colors.green),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            side: BorderSide(color: Colors.green),
          ),
        ),
        SizedBox(height: 20),
        buildSectionTitleIC('Holidays'),
        buildTextFieldIC('Select Days', 'None'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle submit logic
          },
          child: Text('Submit'),
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.deepPurple, // Submit button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextFieldIC(String label, String hint) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget buildSectionTitleIC(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }
}
