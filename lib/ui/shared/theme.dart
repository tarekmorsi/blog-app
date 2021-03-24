import 'package:blog_app/ui/shared/colors.dart';
import 'package:blog_app/ui/shared/typography.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    textTheme: TextTheme(
      headline6: heading20.copyWith(
        color: kPrimary,
      ),
    ),
  ),
  primarySwatch: Colors.grey,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
