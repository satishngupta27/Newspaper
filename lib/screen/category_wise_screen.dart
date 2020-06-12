import 'package:flutter/material.dart';
import 'package:newspaper/widget/constants.dart';

import 'file:///C:/Users/SATISH/AndroidStudioProjects/newspaper/lib/widget/category_content.dart';

class HeadLineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
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
                    Tab(text: "Business"),
                    Tab(text: "Entertainment"),
                    Tab(text: "General"),
                    Tab(text: "Technology"),
                    Tab(text: "Heath"),
                    Tab(text: "Science"),
                    Tab(text: "Sports"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryContentScreen('Business'),
            CategoryContentScreen('Entertainment'),
            CategoryContentScreen('General'),
            CategoryContentScreen('Technology'),
            CategoryContentScreen('health'),
            CategoryContentScreen('Science'),
            CategoryContentScreen('Sports'),
          ],
        ),
      ),
    );
  }
}
