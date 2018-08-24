import 'package:flutter/material.dart';
import '../blocs/login_provider.dart';
import '../blocs/login_bloc.dart';
import '../widgets/buttons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = LoginProvider.of(context);
    return Material(
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(35.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              alignment: Alignment(-2.0, 4.0),
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.07),
                BlendMode.dstATop,
              ),
              image: AssetImage("assets/graphics/logo_color.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/graphics/logo_color.png"),
              buildUsername(bloc),
              buildPassword(bloc),
              builtButton(bloc)
            ],
          ),
        ),
        Positioned(
          bottom: -16.0,
          child: Column(children: <Widget>[
            Text("Don't have an account? "),
            WhiteButton(
              text: 'SIGN UP',
              onPressed: () {},
            )
          ]),
        )
      ],
    ));
  }

  Widget buildUsername(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.username$,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Container(
          height: 80.0,
          margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.red, width: 0.5),
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
            onChanged: bloc.changeUsername$,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                errorText: snapshot.error,
                errorStyle: TextStyle(),
                hintText: 'Username',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 16.0),
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
          height: 80.0,
          margin: EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(boxShadow: [
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
                vertical: 24.0,
                horizontal: 16.0,
              ),
              errorText: snapshot.error,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Password',
              hintStyle: TextStyle(),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 16.0),
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
        return DefaultButton(
          text: Text("SIGN IN"),
          onPressed: snapshot.hasData ? bloc.submit : null,
          isDisabled: !snapshot.hasData,
        );
      },
    );
  }
}
