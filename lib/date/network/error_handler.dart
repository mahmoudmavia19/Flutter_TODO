import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mycourse/utils/app_assets.dart';

class Failure {
  int? id;
  String? message;
  Status? status;
  Failure({this.id, this.message, this.status});
}

enum Status {
  disconnection,
  invalidEmailAndPassword,
  notFondUser,
  emailExist,
  accepted
}

_messageDialog(Failure failure, context) {
  showDialog(
    context: context,
    builder: (context) {
      return _errorWidget(failure);
    },
  );
}

_errorWidget(failure) => Column(
      children: [
        Lottie.asset(AppAssets.error),
        Text(failure.message.toString())
      ],
    );

//-----------------------
enum UiState { loading, content, error, empty }

extension ContentState on UiState {
  Widget getWidget(content) {
    switch (this) {
      case UiState.loading:
        return Lottie.asset(AppAssets.loading);
      case UiState.error:
        return Lottie.asset(AppAssets.error);
      case UiState.content:
        return content;
      case UiState.empty:
        return Lottie.asset(AppAssets.emptyList);
      default:
        return Lottie.asset(AppAssets.loading);
    }
  }
}

