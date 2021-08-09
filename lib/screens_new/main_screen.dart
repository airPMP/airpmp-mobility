import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/enums.dart';
import 'package:airpmp_mobility/utilities/widgets/components/JobListTile.dart';
import 'package:airpmp_mobility/utilities/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final Stage stage;
  const MainPage({Key? key, required this.stage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, bc) {
      if (bc.maxWidth < 600) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: CustomColors.primary,
                  iconTheme: IconThemeData(color: Colors.white),
                  elevation: 0,
                  pinned: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30))),
                  // backgroundColor: Colors.red,
                  flexibleSpace: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "lib/assets/images/appBarBG.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Arab Tech",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 56)
                      ],
                    ),
                  ),
                  expandedHeight: bc.maxHeight / 3.3,
                  bottom: AppBar(
                    elevation: 0,
                    backgroundColor: CustomColors.primary,
                    leadingWidth: 0,
                    leading: Container(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24))),
                    title: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.task,
                          color: CustomColors.icon_not_selected,
                          size: 30,
                        ),
                        Text(
                          "Not Started",
                          style: TextStyle(
                              color: Color(0xff39597E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverAppBar(
                  toolbarHeight: 80,
                  leadingWidth: 0,
                  leading: Container(),
                  backgroundColor: Colors.transparent,
                  title: Row(
                    children: [
                      SizedBox(width: 10),
                      Text("Project:  ",
                          style: TextStyle(
                              color: Color(0xff424C64),
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Expanded(
                        child: Text(
                          "Sama Al Jaddaf infrastructure works DS135/2",
                          style: TextStyle(
                              color: Color(0xff424C64),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, i) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: JobListTile());
                }, childCount: 30))
              ],
            ),
            drawer: CustomDrawer());
      } else {
        return Container();
      }
    });
  }
}
