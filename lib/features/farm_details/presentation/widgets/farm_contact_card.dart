import 'package:flutter/material.dart';

class FarmContactCard extends StatelessWidget {
  const FarmContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: const [
          Row(
            children: [Icon(Icons.access_time, size: 20, color: Colors.grey), SizedBox(width: 8), Text("Mon - Sat: 8:00 AM - 5:00 PM")],
          ),
          SizedBox(height: 8),
          Row(
            children: [Icon(Icons.phone, size: 20, color: Colors.grey), SizedBox(width: 8), Text("+1 555-123-4567")],
          ),
          SizedBox(height: 8),
          Row(
            children: [Icon(Icons.email, size: 20, color: Colors.grey), SizedBox(width: 8), Text("info@sunnyfieldsfarm.ca")],
          ),
          SizedBox(height: 8),
          Row(
            children: [Icon(Icons.web, size: 20, color: Colors.grey), SizedBox(width: 8), Text("www.sunnyfieldsfarm.ca")],
          ),
        ],
      ),
    );
  }
}
