import 'package:blog_app/ui/shared/colors.dart';
import 'package:blog_app/ui/shared/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final bool isLoading;

  PrimaryButton({
    this.onPressed,
    this.label,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      buttonColor: kPrimary,
      minWidth: MediaQuery.of(context).size.width * 0.6,
      child: RaisedButton(
        onPressed: onPressed,
        child: Visibility(
          visible: !isLoading,
          child: Text(
            label,
            style: body20.copyWith(
              color: Colors.white,
            ),
          ),
          replacement: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
