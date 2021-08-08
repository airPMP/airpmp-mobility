import 'package:flutter/material.dart';

import 'components/simpleTableElement.dart';

class SimpleTable extends StatelessWidget {
  const SimpleTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      child: Text(
                    "heading",
                    textAlign: TextAlign.center,
                  )),
                ),
                Expanded(
                  child: Container(
                      child: Text(
                    "heading",
                    textAlign: TextAlign.center,
                  )),
                ),
                Expanded(
                  child: Container(
                      child: Text(
                    "heading",
                    textAlign: TextAlign.center,
                  )),
                ),
                Expanded(
                  child: Container(
                      child: Text(
                    "heading",
                    textAlign: TextAlign.center,
                  )),
                ),
                Expanded(
                  child: Container(
                      child: Text(
                    "heading",
                    textAlign: TextAlign.center,
                  )),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 3,
          color: Color(0xddB4BBC5),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemBuilder: (context, index) => SimpleTableElement(),
              itemCount: 15,
            ),
          ),
        )
      ],
    );
  }
}
