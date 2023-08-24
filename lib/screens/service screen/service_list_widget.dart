import 'package:flutter/material.dart';

class ServiceListWidget extends StatelessWidget {
  // Sample data - headlines with images and descriptions
  final List<Map<String, dynamic>> headlinesData = [
    {
      'headline': 'AI-Powered Marketing Strategy Tools & Analytics',
      'image': 'asset/1.jpg',
      'description':
          'Our Workflow Automation service streamlines and automates repetitive tasks, improving efficiency and productivity in your business operations.',
      'readmore': ''
    },
    {
      'headline': 'Breaking News 2',
      'image': 'asset/2.jpg',
      'description': 'Description for Breaking News 2',
      'readmore': ''
    },
    {
      'headline': 'Breaking News 2',
      'image': 'asset/3.jpg',
      'description': 'Description for Breaking News 2',
      'readmore': ''
    },
    // Add more headlines here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: headlinesData.length,
      itemBuilder: (BuildContext context, int index) {
        final headline = headlinesData[index]['headline'];
        final image = headlinesData[index]['image'];
        final description = headlinesData[index]['description'];
        final readmore = headlinesData[index]['readmore'];

        return ServiceListItem(
          headline: headline,
          image: image,
          description: description,
          readmore: readmore,
        );
      },
    );
  }
}

class ServiceListItem extends StatelessWidget {
  final String headline;
  final String image;
  final String description;
  final String readmore;

  const ServiceListItem(
      {required this.headline,
      required this.image,
      required this.description,
      required this.readmore});

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   title: Text(headline),
    //   subtitle: Column(
    //     children: [
    //       Text(description),
    //       GestureDetector(
    //         onTap: () {},
    //         child: Text(
    //           'Read more',
    //           style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
    //         ),
    //       )
    //     ],
    //   ),
    //   leading:
    //       Image.network(image), // You can replace this with your image widget
    // );
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
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
      child: Row(
        children: [
          Image.asset(
            image,
            scale: 2,
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            height: 350,
            width: 550,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    headline,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {},
                        child: GestureDetector(
                          onTap: () {
                            readmore;
                          },
                          child: Text('Read More',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.indigo.shade900)),
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
