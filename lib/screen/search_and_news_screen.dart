import 'package:flutter/material.dart';
import 'package:newspaper/screen/featured.dart';
import 'package:newspaper/screen/popular_newsstand_screen.dart';
import 'package:newspaper/screen/search_result.dart';
import 'package:newspaper/widget/constants.dart';

class SearchAndNewsStand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(context: context, delegate: Search());
                    }),
                title: Text(
                  " THE",
                  textAlign: TextAlign.end,
                  style: kNonActiveTabStyle,
                ),
                subtitle: Text(
                  "NEWSPAPER",
                  textAlign: TextAlign.end,
                  style: kActiveTabStyle,
                ),
//                trailing: Container(
//                  width: 50.0,
//                  height: 50.0,
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(10.0),
//                    image: DecorationImage(
//                      image: AssetImage("assets/ve.jpg"),
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: kGrey1,
                  unselectedLabelStyle: kNonActiveTabStyle,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelStyle: kActiveTabStyle.copyWith(fontSize: 25.0),
                  tabs: [
                    Tab(text: "Featured"),
                    Tab(text: "Popular"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [FeaturedScreen(), PopularNewsStandScreen()],
        ),
      ),
    );
  }
}
