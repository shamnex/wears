import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String _hintText; 
  final IconData _icon; 
  final bool _hideText ; 

  InputField(this._hintText, this._icon, this._hideText);
  
  @override
  InputFieldState createState() => new InputFieldState();
}

class InputFieldState extends State<InputField> {

  final Color _primaryColor = const Color(0xFF481300);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(vertical:16.0),
      child: new TextFormField(
        keyboardType: TextInputType.text,
        obscureText: widget._hideText,
        decoration: new InputDecoration(
            hintText: widget._hintText,
            hintStyle: new TextStyle(
              color: _primaryColor.withOpacity(0.8),
            ),
            prefixIcon: new Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: new Icon(widget._icon, color: _primaryColor.withOpacity(0.8)),
            )),
      ),
    );
  }
}
