import 'package:clickandcut_admin/Models/Services.dart';
import 'package:flutter/material.dart';

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
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
    },
    {
      'image': 'assets/cut.png',
      'title': 'Haircut',
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
          ServicesBoxWrap(context,ServicesgridItems),
        ],
      ),
    );
  }
}


Container ServicesBoxWrap (BuildContext context,List<Services>ServicesgridItems){
  return Container(
    child:Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
      child: Container(
        height: 392,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(context, ServicesgridItems[0]),
                ServiceBox(context, ServicesgridItems[1]),
                ServiceBox(context, ServicesgridItems[1]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(context, ServicesgridItems[0]),
                ServiceBox(context, ServicesgridItems[1]),
                ServiceBox(context, ServicesgridItems[1]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(context, ServicesgridItems[0]),
                ServiceBox(context, ServicesgridItems[1]),
                ServiceBox(context, ServicesgridItems[1]),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceBox(context, ServicesgridItems[0]),
                ServiceBox(context, ServicesgridItems[1]),
                ServiceBox(context, ServicesgridItems[1]),
              ],
            ),
            
            
          ],
        ),
      ),
    ),
  );
}



Widget ServiceBox (BuildContext context, Services item){
  return Container(
      height: 65,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 7,bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              item.image,
              height: 25,
              width: 30,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
}