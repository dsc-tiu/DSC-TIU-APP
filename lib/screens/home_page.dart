import 'package:dsc_tiu/utils/nav_drawer_list.dart';
import 'package:dsc_tiu/utils/navigation_index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();
  PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      key: _sKey,
      drawer: Drawer(
        child: ListView(
          children: NavDrawerList(
            context: context,
            pageController: controller,
            user: user,
          ).getList(),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.hamburger,
          ),
          onPressed: () => _sKey.currentState.openDrawer(),
        ),
      ),
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          SessionsPage(),
          CoursesPage(),
          AnnouncementsPage(),
          CoreTeamPage(),
          GalleryPage(),
          ContactUsPage(),
          AboutUsPage(),
        ],
      ),
    );
  }
}
