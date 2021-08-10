import 'package:airpmp_mobility/models/tableElement.dart';
import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

class SimpleTableElement extends StatelessWidget {
  /// A Map of Column headings, with the key being the data in the column, and the value being its width ratio(flex).
  final List<TableValueElement> datas;

  const SimpleTableElement({
    Key? key,
    required this.datas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: CustomColors.primary),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          for (TableValueElement tbv in datas)
            Expanded(
              flex: tbv.flex,
              child: Container(
                  child: Text(
                tbv.valueName,
                textAlign: tbv.textAlign,
                maxLines: tbv.maxLines,
              )),
            ),
        ],
      ),
    );
  }
}
