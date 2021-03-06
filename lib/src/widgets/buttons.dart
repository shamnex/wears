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

class WearsButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isDisabled;

  WearsButton({this.text, this.onPressed, this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xFF160800),
            const Color(0xFF481300),
          ],
        ),
      ),
      child: MaterialButton(
        color: isDisabled ? 
        Colors.white.withOpacity(0.4) : 
        Colors.transparent,

        textColor: isDisabled ? 
        Colors.white.withOpacity(0.4) :
         Colors.white,

        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        height: 60.0,
        textTheme: ButtonTextTheme.accent,
          child: Text(text, style: TextStyle( fontFamily: "Antonio", fontSize: 16.0),),
        onPressed: onPressed,
      ),
    );
  }
}

class WearsWhiteButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  WearsWhiteButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        width: 140.0,
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
          height: 60.0,
          textTheme: ButtonTextTheme.accent,
          child: Text(text, style: TextStyle( fontFamily: "Antonio", fontSize: 16.0),),
          onPressed: () => onPressed,
        ),
      ),
    );
  }
}
