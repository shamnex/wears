import 'package:flutter/material.dart';
import 'package:wears/src/blocs/bloc.dart';
import 'package:wears/src/blocs/login/login_bloc.dart';
import 'package:wears/src/widgets/buttons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            _buildBg(bloc),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "assets/graphics/logo_color.png",
                    // color: Colors.green.shade100,
                    height: 100.0,
                  ),
                  buildUsername(bloc),
                  buildPassword(bloc),
                  builtButton(bloc),
                  Text("Forgot Password?")
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildBg(bloc) {
    return Container(
      padding: EdgeInsets.all(35.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          alignment: Alignment(-2.0, 4.0),
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.07),
            // Colors.white.withOpacity(0.1),
            BlendMode.dstATop,
          ),
          image: AssetImage("assets/graphics/logo_color.png"),
        ),
      ),
    );
  }

  Widget buildUsername(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.username$,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Container(
          // alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
          decoration: BoxDecoration(
            // color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: snapshot.hasError
                      ? Colors.red.withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                  spreadRadius: 0.0,
                  offset: Offset.zero,
                  blurRadius: 18.0),
            ],
          ),
          child: TextField(
            style: TextStyle(fontSize: 13.0, color: Colors.black87),
            onChanged: bloc.changeUsername$,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 0.0,
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                errorText: snapshot.error,
                errorStyle: TextStyle(
                  fontSize: 10.0,
                  decorationColor: Colors.red,
                ),
                hintText: 'Username',
                prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.person,
                    color: snapshot.hasError
                        ? Colors.red
                        : Theme.of(context).primaryColor,
                  ),
                )),
          ),
        );
      },
    );
  }

  Widget buildPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password$,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Container(
          margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
          decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
            BoxShadow(
                color: snapshot.hasError
                    ? Colors.red.withOpacity(0.1)
                    : Colors.black.withOpacity(0.1),
                spreadRadius: 0.0,
                offset: Offset.zero,
                blurRadius: 18.0),
          ]),
          child: TextField(
            onChanged: bloc.changePassword$,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 0.0,
              ),
              errorText: snapshot.error,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Password',
              errorStyle: TextStyle(fontSize: 10.0),
              hintStyle: TextStyle(),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.lock,
                  color: snapshot.hasError
                      ? Colors.red
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget builtButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        return WearsButton(
          text: "SIGN IN",
          onPressed: snapshot.hasData ? bloc.submit : null,
          isDisabled: !snapshot.hasData,
        );
      },
    );
  }
}
