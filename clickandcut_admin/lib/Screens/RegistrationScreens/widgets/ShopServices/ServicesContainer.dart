import 'package:clickandcut_admin/Models/Services.dart';
import 'package:clickandcut_admin/Providers/SelectedServicesProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesContainer extends StatefulWidget {
  const ServicesContainer({super.key});

  @override
  State<ServicesContainer> createState() => _ServicesContainerState();
}

class _ServicesContainerState extends State<ServicesContainer> {
  final List<Map<String, dynamic>> ServicesgridItemsJson = [
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/skincare.png',
      'title': 'CleanUp',
    },
    {
      'image': 'assets/nail-polish.png',
      'title': 'Manicure',
    },
    {
      'image': 'assets/shaving-brush.png',
      'title': 'Shave',
    },
    {
      'image': 'assets/bleaching.png',
      'title': 'Bleach',
    },
    {
      'image': 'assets/bride.png',
      'title': 'Party make-up',
    },
    {
      'image': 'assets/massage.png',
      'title': 'Head massage',
    },
    {
      'image': 'assets/tanning.png',
      'title': 'Detan',
    },
    {
      'image': 'assets/pedicure.png',
      'title': 'Pedicure',
    },
    {
      'image': 'assets/face-mask.png',
      'title': 'Facial',
    },
    {
      'image': 'assets/coloring.png',
      'title': 'Hair colouring',
    }, 
  ];
  late List<Services>ServicesgridItems;

  @override
  void initState() {
    super.initState();
    setState(() {
      ServicesgridItems =
          ServicesgridItemsJson.map<Services>((json) => Services.fromJson(json))
              .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:450,
      width: 360,
      decoration: BoxDecoration(
        // color: Colors.blue,
      ),
      child: Column(
        children: [
          ServicesBoxWrap(servicesGridItems: ServicesgridItems),
        ],
      ),
    );
  }
}


class ServicesBoxWrap extends StatelessWidget {
  final List<Services> servicesGridItems;

  const ServicesBoxWrap({
    required this.servicesGridItems,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        height: 441,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[0]),
                ServiceBox(item: servicesGridItems[1]),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[2]),
                ServiceBox(item: servicesGridItems[3]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[4]),
                ServiceBox(item: servicesGridItems[5]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[6]),
                ServiceBox(item: servicesGridItems[7]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[8]),
                ServiceBox(item: servicesGridItems[9]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[10]),
              ]
            ),
          ],
        ),
      ),
    );
  }
}



class ServiceBox extends StatefulWidget {
  final Services item;

  const ServiceBox({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceBox> createState() => _ServiceBoxState();
}

class _ServiceBoxState extends State<ServiceBox> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.item.isSelected;

    return GestureDetector(
      onTap: () {
        setState(() {
          Provider.of<SelectedServicesProvider>(context, listen: false).toggleService(widget.item);
          widget.item.isSelected = !widget.item.isSelected; 
        });

      },
      child: Container(
        height: 95,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.deepPurple : Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.deepPurple[100] : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.item.image,
                height: 50,
                width: 40,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                widget.item.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
