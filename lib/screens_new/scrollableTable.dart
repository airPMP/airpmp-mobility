import 'package:airpmp_mobility/constants/colors.dart';
import 'package:airpmp_mobility/screens_new/scrollableTableElement.dart';
import 'package:flutter/material.dart';

class ScrollableTable extends StatelessWidget {
  const ScrollableTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: 80,
                      child: Text(
                        "heading",
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "heading",
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "heading",
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "heading",
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "heading",
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "heading",
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "heading",
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ),
          Container(
            width: 580,
            height: 3,
            color: Color(0xddB4BBC5),
          ),
          Expanded(
            child: Container(
              width: 580,
              child: ListView.builder(
                itemBuilder: (context, index) => ScrollableTableElement(),
                itemCount: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
