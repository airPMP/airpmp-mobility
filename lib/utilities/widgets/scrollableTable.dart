import 'package:flutter/material.dart';

import 'components/scrollableTableElement.dart';

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
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: 80,
                      child: Text(
                        "Designation",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  VerticalDivider(),
                  Container(
                      width: 80,
                      child: Text(
                        "Allowable Resources",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "Allowable Total Hrs",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "Actual Total Hrs",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "Actual Cost",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "SPI",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "CPI",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            ),
          ),
          Container(
            width: 600,
            height: 3,
            color: Color(0xddB4BBC5),
          ),
          Expanded(
            child: Container(
              width: 600,
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
