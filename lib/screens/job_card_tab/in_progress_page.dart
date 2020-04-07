// PROBLEMS
// the UI is build only after loading of complete data
// data is not injected to UI one by one

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_card/bloc/job_card_bloc/job_card_bloc.dart';
import 'package:job_card/bloc/simple_blocs/simple_blocs_bloc.dart';
import 'package:job_card/global_keys.dart';
import 'package:job_card/models/job_card_models.dart';
import 'package:job_card/utilities/constants.dart';
import 'package:job_card/utilities/widgets.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class InProgressPage extends StatefulWidget {
  @override
  _InProgressPageState createState() => _InProgressPageState();
}

class _InProgressPageState extends State<InProgressPage> {
  JobCardHeaderBloc jobCardHeaderBloc = JobCardHeaderBloc();
  JobCardBodyBloc jobCardBodyBloc = JobCardBodyBloc();
  SimpleBlocsBloc simpleBlocsBloc = SimpleBlocsBloc();
  String sortByDropDownValue = "Date";
  @override
  void initState() {
    // BackButtonInterceptor.add(backButtonInterceptor);
    jobCardHeaderBloc
        .dispatch(GetInProgressByDateHeader(date: DateTime.now().day));
    jobCardBodyBloc.dispatch(
        GetInProgressBody(type: "by_date", filterNumber: DateTime.now().day));
    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(backButtonInterceptor);
    jobCardHeaderBloc.dispose();
    jobCardBodyBloc.dispose();
    super.dispose();
  }

  bool backButtonInterceptor(bool stopDefaultButtonEvent) {
    myJobCardRootPageKey.currentState.pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    FlexibleSpaceBar buildByAllHeader() {}
    FlexibleSpaceBar buildByYearHeader(int selectedYear) {}
    FlexibleSpaceBar buildByMonthHeader(int selectedMonth) {
      int month = DateTime.now().month;
      return FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: BlocBuilder(
          bloc: simpleBlocsBloc,
          builder: (BuildContext context, SimpleBlocsState state) {
            if (state is Rebuild) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(
                      months[month],
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Material(
                                child: Container(
                                  height: 400,
                                  width: 300,
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title: Text(months[index]),
                                        onTap: () {
                                          month = index;
                                          Navigator.pop(context);
                                          simpleBlocsBloc
                                              .dispatch(RebuildDropDownIcon());
                                        },
                                      );
                                    },
                                    itemCount: months.length,
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
              );
            }
            return stateError();
          },
        ),
      );
    }

    FlexibleSpaceBar buildByWeekHeader(int selectedWeek) {
      return FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
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
                        // Text(
                        //   "Tue",
                        //   style: TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    FlexibleSpaceBar buildByDateHeader(int selectedDay) {
      return FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
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
                        // Text(
                        //   "Tue",
                        //   style: TextStyle(fontSize: 12),
                        // ),
                      ],
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              expandedHeight: 150,
              floating: true,
              pinned: true,
              // to show full app bar while slightly scrolling down
              snap: true,
              title: Text("In Progress",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              actions: <Widget>[
                // if i remove this aling widget it's somewhat rising up.
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: BlocBuilder(
                      bloc: simpleBlocsBloc,
                      builder: (BuildContext context, state) {
                        if (state is Rebuild) {
                          return dropDownByDateOrAll(
                            sortByDropDownValue,
                            (value) {
                              sortByDropDownValue = value;
                              simpleBlocsBloc.dispatch(RebuildDropDownIcon());
                              switch (value) {
                                case "Date":
                                  print("dispaching date header event");
                                  jobCardHeaderBloc.dispatch(
                                      GetInProgressByDateHeader(
                                          date: DateTime.now().day));
                                  jobCardBodyBloc.dispatch(GetInProgressBody(
                                      type: "by_date",
                                      filterNumber: DateTime.now().day));
                                  break;
                                case "Month":
                                  print("dispaching month header event");
                                  jobCardHeaderBloc.dispatch(
                                      GetInProgressByMonthHeader(
                                          month: DateTime.now().month));
                                  break;
                                case "Year":
                                  print("dispaching year header event");
                                  jobCardHeaderBloc.dispatch(
                                      GetInProgressByYearHeader(
                                          year: DateTime.now().year));
                                  break;
                                case "All":
                                  print("dispaching by all header event");
                                  jobCardHeaderBloc
                                      .dispatch(GetInProgressByAllHeader());
                                  break;
                                // case "Quarter":
                                //   jobCardHeaderBloc.dispatch(
                                //       GetInProgressByMonthHeader(
                                //           month: DateTime.now().month));
                                //   break;
                                // case "Week":
                                //   jobCardHeaderBloc
                                //       .dispatch(GetInProgressByWeekHeader(week: 1));
                                //   break;

                              }
                            },
                          );
                        }
                        return stateError();
                      },
                    ),
                  ),
                ),
              ],
              flexibleSpace: BlocBuilder(
                bloc: jobCardHeaderBloc,
                builder: (BuildContext context, JobCardHeaderState state) {
                  if (state is BuildHeaderByDate) {
                    print("building date header");
                    return buildByDateHeader(state.day);
                  } else if (state is BuildHeaderByWeek) {
                    print("building week header");
                    return buildByWeekHeader(state.week);
                  } else if (state is BuildHeaderByMonth) {
                    print("building month header");
                    return buildByMonthHeader(state.month);
                  } else if (state is BuildHeaderByYear) {
                    print("building year header");
                    return buildByYearHeader(state.year);
                  } else if (state is BuildHeaderByAll) {
                    print("building by all header");
                    return buildByAllHeader();
                  }
                  return stateError();
                },
              ),
            ),
          ];
        },
        body: BlocBuilder(
          bloc: jobCardBodyBloc,
          builder: (BuildContext context, JobCardBodyState state) {
            if (state is BuildBodyLoading) {
              return buildLoading();
            } else if (state is BuildBodyLoaded) {
              List<MyJobCard> jobCards = state.jobCards;
              return buildListView(jobCards);
            }
            return stateError();
          },
        ),
      ),
    );
  }

  SizedBox buildLoading() {
    return SizedBox(
      width: 100,
      height: 100,
      child: LinearProgressIndicator(
        backgroundColor: Color(0xFFF4442E),
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  ListView buildListView(List<MyJobCard> jobCards) {
    return ListView.separated(
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
        return GestureDetector(
          onTap: () {
            myJobCardRootPageKey.currentState.pushNamed(
              "/detailed_job_card",
              arguments: jobCards[index],
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 300,
                child: Text(
                  jobCards[index].activiyName,
                  style: heading3,
                  softWrap: true,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(jobCards[index].activityCode),
            ],
          ),
        );
      },
      itemCount: jobCards.length,
    );
  }
}

List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

// List<String> day = [
//   "Mon",
//   "Tue",
//   "Wed",
//   "Thu",
//   "Fri",
//   "Sat",
//   "Sun",
// ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: null,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(numerator),
//             SizedBox(height: 3),
//             Divider(
//                 height: 2, color: Colors.white, endIndent: 13, indent: 13),
//             SizedBox(height: 3),
//             Text(denominator),
//           ],
//         ),
//       ),
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               expandedHeight: 180.0,
//               floating: true,
//               pinned: true,
//               // to show full app bar while slightly scrolling down
//               snap: true,
//               title: Text("In Progress", style: TextStyle(fontSize: 20)),
//               actions: <Widget>[
//                 // if i remove this aling widget it's somewhat rising up.
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 10),
//                     child: dropDownByDateOrAll(
//                       isByDateOrAll,
//                       (value) {
//                         setState(
//                           () {
//                             isByDateOrAll = value;
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],

//               flexibleSpace: FlexibleSpaceBar(
//                   collapseMode: CollapseMode.none,
//                   background: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         Text(month,
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold)),
//                         Divider(color: Colors.black54),
//                         SizedBox(
//                           height: 80,
//                           child: ListView.builder(
//                             itemCount: 31,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 child: Column(
//                                   children: <Widget>[
//                                     Padding(
//                                       padding: const EdgeInsets.all(10),
//                                       child: Container(
//                                         height: 30,
//                                         width: 30,
//                                         child: Center(
//                                           child: Text((index + 1).toString()),
//                                         ),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 blurRadius: 2,
//                                                 color: Colors.black38,
//                                                 offset: Offset(0, 2))
//                                           ],
//                                           shape: BoxShape.circle,
//                                           // border: Border.all(width: 1, color: Colors.black54),
//                                         ),
//                                       ),
//                                     ),
//                                     Text(
//                                       "Tue",
//                                       style: TextStyle(fontSize: 12),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//             // SliverPersistentHeader(
//             //   delegate: _SliverAppBarDelegate(
//             //     TabBar(
//             //       // controller: TabController(length: 2),
//             //       labelColor: Colors.black87,
//             //       unselectedLabelColor: Colors.grey,
//             //       tabs: [
//             //         Tab(icon: Icon(Icons.info), text: "Tab 1"),
//             //         Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
//             //       ],
//             //     ),
//             //   ),
//             //   pinned: true,
//             // ),
//             // SliverPersistentHeader(
//             //   delegate: ListHeader(
//             //     widget: Row(
//             //       children: <Widget>[
//             //         Text("Job"),
//             //         Text("Zone")
//             //       ],
//             //     )
//             //   ),
//             //   pinned: true,
//             // ),
//           ];
//         },
//         body: isLoading
//             ? SizedBox(
//                 width: 100,
//                 height: 100,
//                 child: LinearProgressIndicator(
//                   backgroundColor: Color(0xFFF4442E),
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                 ),
//               )
//             // Scaffold(
//             //     body: Center(
//             //       child: Text('loading.......'),
//             //     ),
//             //   )
//             : ListView.separated(
//                 separatorBuilder: (context, index) {
//                   return Column(
//                     children: <Widget>[
//                       SizedBox(height: 20),
//                       // Divider(height: 2,),
//                       // SizedBox(height: 3)
//                     ],
//                   );
//                 },
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       myJobCardRootPageKey.currentState.pushNamed(
//                         "/detailed_job_card",
//                         arguments: inProgressJCs[index],
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Container(
//                           width: 300,
//                           child: Text(
//                             inProgressJCs[index].activiyName,
//                             style: heading3,
//                             softWrap: true,
//                             // overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Text(inProgressJCs[index].activityCode),
//                       ],
//                     ),
//                   );
//                   // ListTile(
//                   //   // dense: true,
//                   //   contentPadding: EdgeInsets.symmetric(horizontal: 30),
//                   //   title: Text(inProgressJCs[index].activiyName),

//                   //   trailing: Text(inProgressJCs[index].activityCode),
//                   // );
//                 },
//                 itemCount: inProgressJCs.length,
//               ),
//       ),
//     );
//   }
// }

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
