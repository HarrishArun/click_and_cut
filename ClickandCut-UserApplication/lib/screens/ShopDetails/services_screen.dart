import 'package:click_and_cut/const.dart';
import 'package:flutter/material.dart';

class ShopServices extends StatefulWidget {
  final List<String> selectedExtraServices;
  final Function(String) updateExtraSelectedServices;
  final Function(List<String>) updateExtraServices;

  ShopServices(
      {required this.selectedExtraServices,
      required this.updateExtraSelectedServices,
      required this.updateExtraServices});

  @override
  _ShopServicesState createState() => _ShopServicesState();
}

class _ShopServicesState extends State<ShopServices> {
  final List<Map<String, dynamic>> services = [
    {"name": "Hair Coloring", "price": "\$50", "time": "1 hr"},
    {"name": "Facial", "price": "\$40", "time": "45 min"},
    {"name": "Manicure", "price": "\$25", "time": "30 min"},
    {"name": "Pedicure", "price": "\$30", "time": "40 min"},
    {"name": "Massage", "price": "\$60", "time": "1 hr"},
    {"name": "Waxing", "price": "\$20", "time": "30 min"},
    {"name": "Hair Styling", "price": "\$35", "time": "45 min"},
    {"name": "Threading", "price": "\$10", "time": "15 min"},
    {"name": "Makeup", "price": "\$70", "time": "1 hr"},
  ];

  List<String> selectedServices = [];

  void toggleServiceSelection(String serviceName) {
    setState(() {
      if (selectedServices.contains(serviceName)) {
        selectedServices.remove(serviceName);
      } else {
        selectedServices.add(serviceName);
      }
    });
  }

  void initState() {
    super.initState();
    setState(() {
      selectedServices.addAll(widget.selectedExtraServices);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop Services'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    final service = services[index];
                    final isSelected =
                        selectedServices.contains(service["name"]);
                    return GestureDetector(
                      onTap: () => toggleServiceSelection(service["name"]),
                      child: Container(
                        decoration: BoxDecoration(
                          border: isSelected
                              ? null // No border if selected
                              : Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                          gradient: isSelected
                              ? LinearGradient(
                                  begin: Alignment
                                      .topLeft, // Define the start point of the gradient
                                  end: Alignment
                                      .bottomRight, // Define the end point of the gradient
                                  colors: [
                                    Color(
                                        klightpurple), // Start color of the gradient
                                    Color(
                                        kdarkpurple), // End color of the gradient
                                  ],
                                )
                              : null, // No gradient if not selected
                          color: isSelected
                              ? null // No solid color if gradient is applied
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                service["name"],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                service["price"],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Est Time: ' + service["time"],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                widget.updateExtraServices(selectedServices);
                for (var item in selectedServices) {
                  widget.updateExtraSelectedServices(item);
                }
                Navigator.of(context).pop();
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
                  borderRadius:
                      BorderRadius.circular(10), // Add border radius if needed
                ),
                height: 50,
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Apply !",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
              ),
            )));
  }
}
