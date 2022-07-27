import 'package:flutter/material.dart';

class Calc_Button extends StatelessWidget {
  final String nb;
  final Color colorapp;
  final Function btnOnClick;
  Calc_Button(this.nb, this.colorapp, this.btnOnClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 70,
        width: 70,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorapp),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          onPressed: () => btnOnClick(nb),
          child: Text(
            nb,
            style: TextStyle(color: Color(0xFF000000), fontSize: 24),
          ),
        ),
      ),
    );
  }
}
