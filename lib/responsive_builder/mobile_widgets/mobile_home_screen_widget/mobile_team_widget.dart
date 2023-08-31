import 'package:flutter/material.dart';

class AndroidTeamWidget extends StatefulWidget {
  const AndroidTeamWidget({super.key});

  @override
  State<AndroidTeamWidget> createState() => _AndroidTeamWidgetState();
}

class _AndroidTeamWidgetState extends State<AndroidTeamWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.5),
      //       spreadRadius: 5,
      //       blurRadius: 10,
      //       offset: Offset(0, 3), // changes the shadow position
      //     ),
      //   ],
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Team',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Founded by a team of experienced marketers and AI experts, Alphacentauric aims to revolutionize the marketing industry by providing cutting-edge AI-based marketing strategy tools.',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, wordSpacing: 2),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'asset/5.jpg',
                scale: 10,
              ),
              const SizedBox(
                width: 30,
              ),
              const SizedBox(
                height: 400,
                width: 250,
                child: Column(
                  children: [
                    Text(
                      'GAYATRI SAMAL',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'With an exceptional understanding of artificial intelligence and machine learning, Annie’s expertise in developing advanced algorithms and data analytics empowers Alphacentauric to deliver accurate predictions and valuable insights to our customers.',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 150,
              ),
              Image.asset(
                'asset/6.jpg',
                scale: 10,
              ),
              const SizedBox(
                width: 30,
              ),
              const SizedBox(
                height: 400,
                width: 250,
                child: Column(
                  children: [
                    Text(
                      'GAYATRI SAMAL',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        'With a wealth of knowledge in marketing strategy and a keen eye for market trends, Jamie skillfully leads Alphacentauric, ensuring our AI-based tools revolutionize the industry and drive success for our clients')
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
