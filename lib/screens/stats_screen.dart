import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_template_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_template_covid_dashboard_ui/data/data.dart';
import 'package:flutter_template_covid_dashboard_ui/widgets/widgets.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(covidCases: covidUSADailyNewCases),
            ),
          ),
        ],
      ),
    );
  }
}

SliverPadding _buildHeader() {
  return SliverPadding(
    padding: EdgeInsets.all(20.0),
    sliver: SliverToBoxAdapter(
      child: Text(
        'Statistics',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

SliverToBoxAdapter _buildRegionTabBar() {
  return SliverToBoxAdapter(
    child: DefaultTabController(
      length: 2,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TabBar(
          indicator: BubbleTabIndicator(
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            indicatorHeight: 40.0,
            indicatorColor: Colors.white,
          ),
          labelStyle: Styles.tabTextStyle,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: [
            Text('My Country'),
            Text('Global'),
          ],
          onTap: (index) {},
        ),
      ),
    ),
  );
}

SliverPadding _buildStatsTabBar() {
  return SliverPadding(
    padding: EdgeInsets.all(20.0),
    sliver: SliverToBoxAdapter(
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelStyle: Styles.tabTextStyle,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: [
            Text('Total'),
            Text('Today'),
            Text('Yesterday'),
          ],
          onTap: (index) {},
        ),
      ),
    ),
  );
}
