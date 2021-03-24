import 'package:blog_app/core/view_models/login/login_view_model.dart';
import 'package:blog_app/ui/shared/typography.dart';
import 'package:blog_app/ui/views/base_widget.dart';
import 'package:blog_app/ui/widgets/primary_button.dart';
import 'package:blog_app/ui/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _error;
  bool isLoading = false;

  submit(LoginViewModel model) async {
    bool valid = _formKey.currentState.validate();
    if (!valid) return;

    setState(() => _error = null);
    setState(() => isLoading = true);
    try {
      await model.submit(
        email: _email,
        password: _password,
      );
    } catch (e) {
      setState(() => _error = e.toString());
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        navigationService: Provider.of(context),
        authenticationService: Provider.of(context),
      ),
      builder: (_, model, context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Text(
                  'Blogs 📝',
                  style: heading40,
                ),
                SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextInputField(
                        labelText: 'Email',
                        onChanged: (String value) =>
                            setState(() => _email = value),
                        initialValue: _email,
                        validator: (String value) =>
                            value == null || value.isEmpty
                                ? 'Email is required'
                                : null,
                      ),
                      TextInputField(
                        labelText: 'Password',
                        onChanged: (String value) =>
                            setState(() => _password = value),
                        initialValue: _password,
                        obscure: true,
                        validator: (String value) =>
                            value == null || value.isEmpty
                                ? 'Password is required'
                                : null,
                      ),
                      SizedBox(height: 20),
                      Visibility(
                        visible: _error != null && _error.isNotEmpty,
                        child: Text(
                          '$_error',
                          style: body15.copyWith(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      PrimaryButton(
                        isLoading: isLoading,
                        onPressed: () => submit(model),
                        label: 'Sign in',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
