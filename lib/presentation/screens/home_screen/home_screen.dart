import 'package:flutter/material.dart';
import 'package:g_02/core/images_path/images_path.dart';
import 'package:g_02/presentation/screens/profile_screen/profile_screen.dart';
import 'package:g_02/presentation/widgets/home_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Food App",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: false,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (builder) => ProfileScreen()),
                  );
                },
                icon: Icon(Icons.notifications_none, color: Colors.white),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.local_convenience_store_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Deliciuos Resturant",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_rounded, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              "4.8",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "(230 reviews)",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "(+150 Orders)",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HomeCard(
                    width: 200,
                    child: Image.asset(
                      ImagesPath.natureImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  HomeCard(
                    width: 150,
                    child: Image.asset(ImagesPath.natureImage),
                  ),
                  HomeCard(width: 200, child: Icon(Icons.topic)),
                  HomeCard(width: 200, child: Icon(Icons.phone_missed)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
