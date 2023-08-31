import 'package:flutter/material.dart';

class TabServicesWidget extends StatefulWidget {
  const TabServicesWidget({super.key});

  @override
  State<TabServicesWidget> createState() => _TabServicesWidgetState();
}

class _TabServicesWidgetState extends State<TabServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Our Services ',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          height: 650,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                height: 650,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes the shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'asset/1.jpg',
                      scale: 1.4,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'AI-Powered Marketing Strategy Tools & Analytics',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Our Workflow Automation service streamlines and automates repetitive tasks, improving efficiency and productivity in your business operations.',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Read More',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.indigo.shade900))))
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                height: 650,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes the shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'asset/3.jpg',
                      scale: 1.4,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'AI-Powered Marketing Strategy Predictive Analytics',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Our Predictive Analytics service utilizes advanced algorithms to analyze historical data and forecast future trends, enabling informed decision-making for businesses',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Read More',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.indigo.shade900))))
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                height: 650,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes the shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'asset/2.jpg',
                      scale: 1.4,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'AI-powered Marketing Strategy Tools',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Our AI Marketing Tools provide businesses with advanced analytics, personalized messaging, and automated campaigns for effective marketing strategies.',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Read More',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.indigo.shade900))))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
