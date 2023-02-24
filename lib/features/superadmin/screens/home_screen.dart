import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lima_app/common/services/logout.dart';
import 'package:lima_app/constants/global_variables.dart';
import 'package:lima_app/features/superadmin/screens/add_corp.dart';
import 'package:lima_app/features/corp/screens/corp_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  void handleClick(int item) {
    switch (item) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CorpMainScreen()));
        break;
      case 1:
        LogOutService().logOut(context);
        break;
    }
  }

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  List<String> images = [
    "assets/images/CORP.png",
    "assets/images/admin.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: const Text(
              'My Dashboard',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              PopupMenuButton<int>(
                onSelected: (item) => handleClick(item),
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(value: 0, child: Text('Account')),
                  const PopupMenuItem<int>(value: 1, child: Text('Logout')),
                ],
              ),
            ],
            // bottom: TabBar(
            //   labelColor: Colors.white,
            //   indicatorColor: Colors.black12,
            //   // isScrollable: true,
            //   tabs: const [
            //     Tab(
            //         child: Text(
            //       'Helloo',
            //       style: TextStyle(
            //         fontSize: 15,
            //       ),
            //     )),
            //   ],
            //   controller: _tabController,
            //   indicatorSize: TabBarIndicatorSize.tab,
            // ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: customContainer(
          //   SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CorpMainScreen()));
                      },
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage("assets/images/CORP.png"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Add Corp",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2)),
                          )
                        ],
                      ),
                    ),
                  ),
                  // add admin
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const AddCorpScreen()));
                      },
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage("assets/images/admin.png"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Add Admin",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //   ),
          // ),
        ));
  }
}
