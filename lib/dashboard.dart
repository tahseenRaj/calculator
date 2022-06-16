import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.greenAccent,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.calculate_outlined,color: Colors.lightBlueAccent,),
                          Text('Calculator')
                        ],
                      ),
                    ),
                    const Tab(
                      text: '💱 Currency Converter',
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Center(
                child: Calculator(),
              ),
              Center(
                child: Text("It's rainy here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
