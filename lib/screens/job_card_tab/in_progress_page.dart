// PROBLEMS
// the UI is build only after loading of complete data
// data is not injected to UI one by one

import 'package:flutter/material.dart';
import 'package:job_card/models/job_card_models.dart';
import 'package:job_card/utilities/constants.dart';
import 'package:job_card/utilities/functions.dart';
import 'package:job_card/utilities/widgets.dart';

class InProgressPage extends StatefulWidget {
  @override
  _InProgressPageState createState() => _InProgressPageState();
}

class _InProgressPageState extends State<InProgressPage> {
  String month = "February";
  String isByDateOrAll = "Date";
  String token;
  List<MyJobCard> inProgressJCs;
  bool isLoading = true;

  // job card is obtained immediatly after the widget is called
  @override
  void initState() {
    getDataForInProgress();
    super.initState();
  }

  Future<void> getDataForInProgress() async {
    // print('to work at start running.............');
    token = await getSavedToken();
    // print('token getting done...');
    inProgressJCs = await getInProgressJobCard(token);
    // print('fileterd in progress jcs');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // key: myJobCardRootPageKey,
      onWillPop: () {
        return Future.value(true);
        // return Future.value(false);
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("11"),
              SizedBox(height: 3),
              Divider(
                  height: 2, color: Colors.white, endIndent: 13, indent: 13),
              SizedBox(height: 3),
              Text("23"),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 180.0,
                floating: true,
                pinned: true,
                // to show full app bar while slightly scrolling down
                snap: true,
                title: Text("In Progress", style: TextStyle(fontSize: 20)),
                actions: <Widget>[
                  // if i remove this aling widget it's somewhat rising up.
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: dropDownByDateOrAll(
                        isByDateOrAll,
                        (value) {
                          setState(
                            () {
                              isByDateOrAll = value;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],

                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.none,
                    background: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(month,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Divider(color: Colors.black54),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              itemCount: 31,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                            child: Text((index + 1).toString()),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 2,
                                                  color: Colors.black38,
                                                  offset: Offset(0, 2))
                                            ],
                                            shape: BoxShape.circle,
                                            // border: Border.all(width: 1, color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Tue",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              // SliverPersistentHeader(
              //   delegate: _SliverAppBarDelegate(
              //     TabBar(
              //       // controller: TabController(length: 2),
              //       labelColor: Colors.black87,
              //       unselectedLabelColor: Colors.grey,
              //       tabs: [
              //         Tab(icon: Icon(Icons.info), text: "Tab 1"),
              //         Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
              //       ],
              //     ),
              //   ),
              //   pinned: true,
              // ),
              // SliverPersistentHeader(
              //   delegate: ListHeader(
              //     widget: Row(
              //       children: <Widget>[
              //         Text("Job"),
              //         Text("Zone")
              //       ],
              //     )
              //   ),
              //   pinned: true,
              // ),
            ];
          },
          body: isLoading
              ? SizedBox(
                  width: 100,
                  height: 100,
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0xFFF4442E),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              // Scaffold(
              //     body: Center(
              //       child: Text('loading.......'),
              //     ),
              //   )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        // Divider(height: 2,),
                        // SizedBox(height: 3)
                      ],
                    );
                  },
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 300,
                          child: Text(
                            inProgressJCs[index].activiyName,
                            style: heading3,
                            softWrap: true,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(inProgressJCs[index].activityCode),
                      ],
                    );
                    // ListTile(
                    //   // dense: true,
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    //   title: Text(inProgressJCs[index].activiyName),

                    //   trailing: Text(inProgressJCs[index].activityCode),
                    // );
                  },
                  itemCount: inProgressJCs.length,
                ),
        ),
      ),
    );
  }
}
// class ListHeader extends SliverPersistentHeaderDelegate {
//   ListHeader({this.widget});

//   final Widget widget;

//   @override
//   double get minExtent => 10;
//   @override
//   double get maxExtent => 10;
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new Container(
//       child: widget,
//     );
//   }

//   @override
//   bool shouldRebuild(ListHeader oldDelegate) {
//     return true;
//   }
// }
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new Container(
//       child: _tabBar,
//     );
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }
