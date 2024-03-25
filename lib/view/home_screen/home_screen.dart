import 'package:api_integration_sample_2/controller/home_controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = Provider.of<HomeScreenController>(context);
    return Scaffold(
      body: homeScreenState.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: homeScreenState.dataList?.length,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Text(homeScreenState.dataList?[index].email ?? "empty"),
                  )),
    );
  }
}
