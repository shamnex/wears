import 'package:flutter/material.dart';

class OutLineButton extends StatelessWidget {
  final String _buttonText;
  final VoidCallback _onTap;
  OutLineButton(this._buttonText, this._onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.red,
      onTap: () => _onTap(),
      child: Container(
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child: Center(
          child: Text(
            _buttonText,
            style: TextStyle(
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
  final Widget text;
  final Function onPressed;
  final bool isDisabled;

  DefaultButton({this.text, this.onPressed, this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: isDisabled
              ? [
                  const Color(0xFF160800).withOpacity(0.4),
                  const Color(0xFF481300).withOpacity(0.4),
                ]
              : [
                  const Color(0xFF160800),
                  const Color(0xFF481300),
                ],
        ),
      ),
      child: MaterialButton(
        color: Colors.transparent,
        textColor: Colors.white,
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        height: 65.0,
        textTheme: ButtonTextTheme.accent,
        child: text,
        onPressed: onPressed,
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  final String _buttonText;
  final Function _onTap;
  WhiteButton(this._buttonText, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0.0,
                  offset: Offset.zero,
                  blurRadius: 18.0)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white, Colors.white])),
        child: MaterialButton(
          color: Colors.white,
          textColor: const Color(0xFF481300),
          minWidth: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          height: 65.0,
          textTheme: ButtonTextTheme.accent,
          child: Text(_buttonText),
          onPressed: () => _onTap,
        ),
      ),
    );
  }
}
