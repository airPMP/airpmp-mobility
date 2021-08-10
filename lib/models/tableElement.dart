import 'package:flutter/cupertino.dart';

class TableElement {
  String valueName = "";
  int flex = 1;
  int maxLines = 2;
  TextAlign textAlign = TextAlign.center;
  TableElement(this.valueName,
      {this.flex = 1, this.maxLines = 2, this.textAlign = TextAlign.center});
}

class TableValueElement extends TableElement {
  /// when false, the flex of the object will be ignored, and the flex of the column will be taken instead.
  bool useCustomflex = false;
  TableValueElement(valueName,
      {flex = 1,
      maxLines = 2,
      textAlign = TextAlign.center,
      this.useCustomflex = false})
      : super(valueName, flex: flex, maxLines: maxLines, textAlign: textAlign);
}
