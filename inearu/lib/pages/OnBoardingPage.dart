import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnboardingScreenPage extends StatelessWidget {
  static const String routename = '/onboardingscreen';

  final List<String> images = [
    'https://images.unsplash.com/photo-1663024718100-9250a83a1db5?ixlib=rb-1.2.1&ixid=Mn',
    'https://images.unsplash.com/photo-1663017933548-6692e8e0518d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx',
    'https://images.unsplash.com/photo-1540174401473-df5f1c06c716?ixlib=rb-4.0.3&ixid=Mn',
  ];

  final List<String> names = [
    'John Doe',
    'Jane Smith',
    'Bob Johnson',
    'Samantha Williams',
    'Michael Brown',
    'Emily Davis'
  ];
  final List<String> ages = ['25', '28', '30', '32', '35', '40'];
  final List<String> jobTitles = [
    'Developer',
    'Designer',
    'Product Manager',
    'Project Manager',
    'Quality Assurance',
    'Product Analyst'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                            bottom: 32,
                            left: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  names[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  ages[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  jobTitles[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.close),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.favorite),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.info),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
