import 'package:flutter/material.dart';

class OutLineButton extends StatelessWidget {
  final String _buttonText;
  final VoidCallback _onTap;

  OutLineButton(this._buttonText, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      highlightColor: Colors.red,
      onTap: () => _onTap(),
      child: new Container(
        width: MediaQuery.of(context).size.width,
        padding: new EdgeInsets.all(25.0),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white, width: 2.0),
        ),
        child: new Center(
          child: new Text(
            _buttonText,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String _buttonText;
  final VoidCallback _onTap;

  DefaultButton(this._buttonText, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => _onTap(),
      child: new Container(
        padding: new EdgeInsets.all(25.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(color: Colors.white, width: 2.0),
        ),
        child: new Center(
          child: new Text(
            _buttonText,
            style: new TextStyle(
              color:  Colors.brown,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
