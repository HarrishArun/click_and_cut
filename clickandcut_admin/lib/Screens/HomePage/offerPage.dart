import 'package:clickandcut_admin/Models/Offer.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  final TextEditingController _comboNameController = TextEditingController();
  final TextEditingController _originalAmountController = TextEditingController();
  final TextEditingController _offerAmountController = TextEditingController();
  final List<String> _services = ['Haircut', 'Shave', 'Massage']; // Example services
  final List<String> _selectedServices = [];
  final List<Offer> _offers = [];

  void _addOffer() {
    if (_selectedServices.isEmpty ||
        _comboNameController.text.isEmpty ||
        _originalAmountController.text.isEmpty ||
        _offerAmountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    final offer = Offer(
      comboName: _comboNameController.text,
      services: List.from(_selectedServices),
      originalAmount: double.parse(_originalAmountController.text),
      offerAmount: double.parse(_offerAmountController.text),
    );

    setState(() {
      _offers.add(offer);
      _comboNameController.clear();
      _originalAmountController.clear();
      _offerAmountController.clear();
      _selectedServices.clear();
    });
  }

  void _removeOffer(int index) {
    setState(() {
      _offers.removeAt(index);
    });
  }

  void _toggleServiceSelection(String service) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
      } else if (_selectedServices.length < 3) {
        _selectedServices.add(service);
      }
    });
  }

  void _goBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No screen to pop')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _goBack,
                ),
                SizedBox(width: 16),
                Text(
                  'Offer Creation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextField(
              controller: _comboNameController,
              decoration: InputDecoration(labelText: 'Combo Name'),
            ),
            SizedBox(height: 10),
            Text('Select Services (up to 3)'),
            Wrap(
              spacing: 8.0,
              children: _services.map((service) {
                final isSelected = _selectedServices.contains(service);
                return ChoiceChip(
                  label: Text(service),
                  selected: isSelected,
                  onSelected: (_) => _toggleServiceSelection(service),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _originalAmountController,
              decoration: InputDecoration(labelText: 'Original Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _offerAmountController,
              decoration: InputDecoration(labelText: 'Offer Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addOffer,
              child: Text('Create'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _offers.length,
                itemBuilder: (context, index) {
                  final offer = _offers[index];
                  return Card(
                    child: ListTile(
                      title: Text(offer.comboName),
                      subtitle: Text(
                          'Services: ${offer.services.join(', ')}\n'
                          'Original: \$${offer.originalAmount.toStringAsFixed(2)}\n'
                          'Offer: \$${offer.offerAmount.toStringAsFixed(2)}',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeOffer(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
