import 'package:flutter/material.dart';
import 'package:job_card/utilities/widgets.dart';

class NotStartedPage extends StatefulWidget {
  @override
  _NotStartedPageState createState() => _NotStartedPageState();
}

class _NotStartedPageState extends State<NotStartedPage> {
  String month = "FEB";
  String isByDateOrAll = "All";
  @override
  // note this function is repeated in another file too.
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // Navigator.pop(context, false);
        return Future.value(true);
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
        appBar: AppBar(
          title: Text(
            "Not Completed",
            style: TextStyle(fontSize: 22),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 8, bottom: 8),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey
                      // Color(0xFF2D4E93),
                      ),
                  // height: 30,
                  width: 50,
                  child: Center(
                    child: Text(
                      month,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              // SafeArea(
              //   child: Container(
              //     height: 60,
              //     width: double.infinity,
              //     child: ListTile(
              //       title: Center(
              //           child: Text(
              //         "Not Completed",
              //         style: TextStyle(fontSize: 22),
              //       )),
              //       leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
              //       trailing: InkWell(
              //         onTap: () {},
              //         child: Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               color: Color(0xFF2D4E93)),
              //           height: 30,
              //           width: 50,
              //           child: Center(
              //             child: Text(
              //               month,
              //               style: TextStyle(color: Colors.white),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: Colors.black26, width: 1),
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 4,
              //             color: Colors.black26,
              //             offset: Offset(0, 2),
              //           )
              //         ]),
              //   ),
              // ),
              Align(
                child: dropDownByDateOrAll(
                  isByDateOrAll,
                  (value) {
                    setState(() {
                      isByDateOrAll = value;
                    });
                  },
                ),
                alignment: Alignment.centerLeft,
              ),
              Divider(color: Colors.black54),
              SizedBox(
                height: 90,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Job"),
                    Text("Zone"),
                  ],
                ),
              ),
              Divider(
                color: Colors.black54,
                height: 3,
                endIndent: 30,
                indent: 30,
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SizedBox(
                        width: 240,
                        child: Text(
                          "Chilled Water Pipe-Installation of Pipe",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      trailing: Text(
                        "T1 - F1R3",
                        style: TextStyle(fontSize: 17),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
