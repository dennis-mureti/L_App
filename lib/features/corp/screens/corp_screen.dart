import 'package:flutter/material.dart';
import 'package:lima_app/constants/global_variables.dart';
import 'package:lima_app/features/superadmin/screens/add_corp.dart';
import 'package:lima_app/features/superadmin/screens/view_corp.dart';

class CorpMainScreen extends StatefulWidget {
  const CorpMainScreen({Key? key}) : super(key: key);

  @override
  State<CorpMainScreen> createState() => _CorpMainScreenState();
}

class _CorpMainScreenState extends State<CorpMainScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(50),
      appBar: AppBar(
        centerTitle: false,
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.green,
          // isScrollable: true,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            const Tab(child: Text('Add Corp')),
            const Tab(child: Text('View Corp')),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        title: const Text(
          'Corp',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: TabBarView(
        children: [
          Center(
            child: AddCorpScreen(),
          ),
          const ViewCorpScreen(),
        ],
        controller: _tabController,
      ),
    );
  }
}
