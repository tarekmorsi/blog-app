import 'package:blog_app/core/view_models/splash/splash_view_model.dart';
import 'package:blog_app/ui/views/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
      model: SplashViewModel(
        navigationService: Provider.of(context),
        authenticationService: Provider.of(context),
      ),
      onModelReady: (model) => model.init(),
      builder: (_, model, context) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
