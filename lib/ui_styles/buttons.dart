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
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        padding: new EdgeInsets.all(28.0),
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
    return new Padding(
      padding: new EdgeInsets.symmetric(vertical:16.0),
      child: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [const Color(0xFF481300), const Color(0xFF160800)])),

        child: new MaterialButton(
          color: Colors.transparent,
          textColor: Colors.white,
          minWidth: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          height: 65.0,
          textTheme: ButtonTextTheme.accent,
          child: new Text(_buttonText),
          onPressed: () => _onTap(),
        ),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  final String _buttonText;
  final VoidCallback _onTap;
  WhiteButton(this._buttonText, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(vertical:16.0),
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0.0,
              offset: Offset.zero,
              blurRadius: 18.0

            )
          ],
            gradient: new LinearGradient(
              begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [ Colors.white,  Colors.white])),

        child: new MaterialButton(
          color: Colors.white,
          textColor: const Color(0xFF481300),
          minWidth: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          height: 65.0,
          textTheme: ButtonTextTheme.accent,
          child: new Text(_buttonText),
          onPressed: () => _onTap,
        ),
      ),
    );
  }
}
