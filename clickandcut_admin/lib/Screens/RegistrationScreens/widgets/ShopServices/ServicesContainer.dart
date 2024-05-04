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
      'image': 'assets/cut.png',
      'title': 'CleanUp',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Manicure',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Shave',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Bleach',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Party make-up',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Head massage',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Detan',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Pedicure',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Facial',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Hair colouring',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Massage',
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
      height:400,
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
        height: 392,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[0]),
                ServiceBox(item: servicesGridItems[1]),
                ServiceBox(item: servicesGridItems[2]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[3]),
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
                ServiceBox(item: servicesGridItems[8]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(item: servicesGridItems[9]),
                ServiceBox(item: servicesGridItems[10]),
                ServiceBox(item: servicesGridItems[11]),
              ],
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
        height: 75,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.deepPurple[50] : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.item.image,
                height: 25,
                width: 30,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                widget.item.title,
                style: TextStyle(
                  fontSize: 11,
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
