import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
            ),
            Text('‘Organization Name’ is a worldwide computerized item advancement organization.'),
            SizedBox(
              height: 16,
            ),
            Text('We cooperate with organizations of all sizes to assemble, enhance and scale items crosswise over stages utilizing problematic advances and consolidating configuration, building, and development to make our customers effectively.'),
            SizedBox(
              height: 16,
            ),
            Text('Our Mission',style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),),
            SizedBox(
              height: 16,
            ),
            Text('Be the believed innovation accomplice of worldwide organizations to engage them with transformation innovation arrangements.'),
            SizedBox(
              height: 16,
            ),
            Text('Our Story',style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),),
            SizedBox(
              height: 16,
            ),
            Text('We began as a totally bootstrapped organization in 2010 with a portable first improvement approach and rose as a conclusion-to-end computerized item building organization.'),
          ],
        ),
      ),
    );
  }
}
