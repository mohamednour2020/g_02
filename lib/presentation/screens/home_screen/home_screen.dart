import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_02/core/images_path/images_path.dart';
import 'package:g_02/presentation/cubits/popular_people_cubit/popular_people_cubit.dart';
import 'package:g_02/presentation/screens/profile_screen/profile_screen.dart';
import 'package:g_02/presentation/widgets/home_card.dart';

class MyHomePage extends StatefulWidget {
  final String email;

  const MyHomePage({super.key, required this.email});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    BlocProvider.of<PopularPeopleCubit>(context).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          widget.email,
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
      body: BlocBuilder<PopularPeopleCubit, PopularPeopleState>(
        builder: (context, state) {
          return state is PopularPeopleLoading
              ? Center(child: CircularProgressIndicator())
              : state is PopularPeopleSuccess
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
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
                                    state
                                            .popularPeopleModel
                                            .results?[index]
                                            .name ??
                                        "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        state
                                            .popularPeopleModel
                                            .results![index]
                                            .popularity
                                            .toString(),
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
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: state.popularPeopleModel.results!.length,
                  ),
                )
              : Center(child: Text("an error occured"));
        },
      ),
    );
  }
}
