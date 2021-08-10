import 'package:airpmp_mobility/models/tableElement.dart';
import 'package:flutter/material.dart';

import 'components/simpleTableElement.dart';

class SimpleTable extends StatelessWidget {
  ///Table headers as implemented using the same [TableElement] class itself.
  final List<TableElement> headings;

  /// A list of [SimpleTableElement]s
  final List<SimpleTableElement> elements;

  const SimpleTable({
    Key? key,
    required this.headings,
    required this.elements,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (TableElement h in headings)
                  Expanded(
                    flex: h.flex,
                    child: Container(
                        child: Text(
                      h.valueName,
                      textAlign: h.textAlign,
                      maxLines: h.maxLines,
                      overflow: TextOverflow.ellipsis,
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
            margin: EdgeInsets.all(5),
            child: ListView.builder(
              itemBuilder: (context, index) {
                for (int i = 0; i < elements[index].datas.length; i++)
                  if (!elements[index].datas[i].useCustomflex) {
                    elements[index].datas[i].flex = headings[i].flex;
                  }
                return elements[index];
              },
              itemCount: elements.length,
            ),
          ),
        )
      ],
    );
  }
}
