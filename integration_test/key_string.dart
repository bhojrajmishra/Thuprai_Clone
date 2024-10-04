import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final loginButton = find.byKey(
  const Key('login'),
);
final passwordTextfield = find.byKey(const Key('Password'));
final emailTextfield = find.byKey(const Key('Email'));
