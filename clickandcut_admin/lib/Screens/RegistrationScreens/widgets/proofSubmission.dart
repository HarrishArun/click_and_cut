import 'package:clickandcut_admin/Screens/RegistrationScreens/approvalWaiting.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ProofSubmission extends StatefulWidget {
  @override
  _ProofSubmissionState createState() => _ProofSubmissionState();
}

class _ProofSubmissionState extends State<ProofSubmission> {
  List<String> fileList = [];

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Submit your proof ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            // SizedBox(height: 20),
            // Text(
            //   '(Aadhar Card, Driving Licence, PAN card, Voter Id)',
            //   style: TextStyle(fontSize: 16,color: Colors.white54),
            // ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _showImageUploadDialog(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shadowColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Upload Proof Image',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: fileList.isEmpty
                ? Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/empty-archive.png', // Path to your null image asset
                          height: 200, // Adjust height as needed
                        ),
                        Text(
                          'No proof added!',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: fileList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          fileList[index],
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        leading: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      );
                    },
                  ),
            ),
            ElevatedButton(
              onPressed: () {
                _showPolicyDialog(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      );
    
  }

  Future<void> _showImageUploadDialog(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? proofType = await _showProofTypeDialog(context);

      if (proofType != null) {
        setState(() {
          fileList.add(proofType);
        });
      }
    } else {
      print('File picking canceled.');
    }
  }

  Future<String?> _showProofTypeDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Proof Type',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Please select the type of proof for the uploaded file:',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(child: Text('Aadhar Card'), value: 'Aadhar Card'),
                  DropdownMenuItem(child: Text('Driving Licence'), value: 'Driving Licence'),
                  DropdownMenuItem(child: Text('PAN Card'), value: 'PAN Card'),
                  DropdownMenuItem(child: Text('Voter ID'), value: 'Voter ID'),
                ],
                onChanged: (String? value) {
                  Navigator.of(context).pop(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void _showPolicyDialog(BuildContext context) {
  bool checkBoxValue = false;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text(
              'Salon Owner Policies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Appointment Policy: Salon owners must ensure availability during scheduled appointment hours and be ready to serve clients promptly.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '2. Equipment Policy: It is the responsibility of salon owners to maintain all equipment in good working condition and ensure its regular maintenance and sanitization.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '3. Staff Management Policy: Salon owners are required to manage their staff efficiently, provide necessary training, and ensure compliance with salon policies and regulations.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '4. Customer Service Policy: Salon owners should prioritize excellent customer service, address client concerns promptly, and strive to create a welcoming and comfortable environment for all patrons.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '5. Hygiene Policy: Maintaining cleanliness and hygiene standards is paramount. Salon owners must ensure regular sanitation of all workspaces, tools, and equipment.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '6. Pricing Policy: Transparent pricing should be displayed for all services, and salon owners should adhere to fair pricing practices without discrimination.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '7. Safety Policy: Implementing safety protocols and procedures to protect both clients and staff is essential. This includes fire safety measures, emergency exits, and adherence to local health regulations.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '8. Training Policy: Continual training and professional development opportunities should be provided to staff members to enhance their skills and keep them updated with industry trends.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '9. Confidentiality Policy: Salon owners must respect client confidentiality and ensure that sensitive information is kept secure and private at all times.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '10. Complaints Policy: Establishing a procedure for handling client complaints professionally and efficiently is crucial. Salon owners should address grievances promptly and work towards resolving them to the client\'s satisfaction.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Add more policies as needed
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            checkBoxValue = value!;
                          });
                        },
                      ),
                      Text(
                        'I agree to the above policies',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: checkBoxValue
                    ? () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WaitingForApproval()),
                        );
                      }
                    : null,
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    },
  );
}
