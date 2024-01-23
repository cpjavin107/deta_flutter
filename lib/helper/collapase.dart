import 'dart:math';

import 'package:flutter/material.dart';

import '../res/colors/appcolors.dart';
// ignore_for_file: prefer_const_constructors

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: DashboardHeaderPersistentDelegate(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (_, i) => Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        i.toString(),
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Text('Text'),
                    ),
                  ],
                ),
              ),
            ),
            childCount: 100,
          ),
        ),
      ],
    );
  }
}

const categories = [
  'Grocieries',
  'Transport',
  'House Rent',
  'Shopping',
  'Career'
];
const categoriesIcons = [
  Icons.ac_unit,
  Icons.access_alarms,
  Icons.dashboard,
  Icons.accessible_forward,
  Icons.backspace,
];

class DashboardHeaderPersistentDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.maroonColor,
        ),
      ),
      child: Material(
        elevation: 0,
        shadowColor: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: max(
                    60,
                    100 * (1 - shrinkPercentage),
                  ),
                ),
                child: FittedBox(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: 200,
                    child: const Text(
                      '\$ 5329.05',
                      style: TextStyle(
                        fontFamily: 'Barlow',
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    if (shrinkPercentage != 1)
                      Opacity(
                        opacity: 1 - shrinkPercentage,
                        child: _buildInformationWidget(context),
                      ),
                    if (shrinkPercentage != 0)
                      Opacity(
                        opacity: shrinkPercentage,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _buildCollapsedInformationWidget(),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInformationWidget(BuildContext context) => ClipRect(
    child: OverflowBox(
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'AVAILABLE BALANCE',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: Colors.black26),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text(
                        '\$ 11200',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Barlow',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.green[400],
                        ),
                      ),
                    ),
                    const Text(
                      ' I ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black12,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        '\$ 400',
                        style: TextStyle(
                          fontFamily: 'Barlow',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.red[400],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12, top: 12),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "CATEGORIES",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: Colors.black26,
                  ),
                ),
              ),
              SizedBox(
                height: 88,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: (index == 0) ? 24.0 : 8.0,
                          right: (index == categories.length - 1)
                              ? 24.0
                              : 8.0),
                      child: _buildCategoryItem(
                        categoriesIcons[index],
                        categories[index],
                        .9,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );

  Widget _buildCollapsedInformationWidget() => Row(
    children: [
      const Text("Recent"),
      const Spacer(),
      Text(
        '\$ 11200',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontFamily: 'Barlow',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.green[400],
        ),
      ),
      const Text(
        ' I ',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black12,
        ),
      ),
      Text(
        '\$ 400',
        style: TextStyle(
          fontFamily: 'Barlow',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.red[400],
        ),
      )
    ],
  );

  Widget _buildCategoryItem(
      IconData data, String categoryTitle, double percentage) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.blue[400],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    data,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  value: percentage,
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            ],
          ),
          Container(
            width: 72,
            alignment: Alignment.center,
            child: Text(
              categoryTitle,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
          )
        ],
      );

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
