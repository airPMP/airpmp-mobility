import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton(
      {Key? key, required this.label, required this.onPressed, this.iconData})
      : super(key: key);
  final IconData? iconData;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed(),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: CustomColors.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 5, 8),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 8, 12, 8),
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
