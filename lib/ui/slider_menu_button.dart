import 'package:flutter/material.dart';

class SliderMenuButton extends StatelessWidget {
  VoidCallback onPressed;
  bool isSelected;
  String text;
  IconData icon;
  SliderMenuButton(
      {Key key,
      @required this.onPressed,
      this.isSelected: false,
      @required this.text,
      @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: this.onPressed,
      child: Container(
        color: this.isSelected ? Colors.grey[100] : Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(bottom: 4, top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                this.icon,
                color: this.isSelected ? Colors.purple[600] : Colors.grey[700],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  this.text,
                  style: theme.textTheme.button.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                        this.isSelected ? Colors.purple[600] : Colors.grey[700],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
