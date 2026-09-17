import 'package:flutter/material.dart';

import '../constants/style_constant.dart';

Future showProcessDialog(context) => showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text(
            "Processing..",
            style: pageTitleStyle,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                height: 16,
              ),
              Text(
                "Please wait...",
                style: pageSubTitleStyle,
              )
            ],
          ),
        ),
      );
    });

Future showSuccessDialog(context, successMsg, onPressedFunc) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        'Success',
        style: pageTitleStyleSuccess,
      ),
      content: Text(successMsg),
      actions: <Widget>[
        TextButton(
          onPressed: onPressedFunc,
          child: Text(
            'Close',
            style: mSubHeading,
          ),
        )
      ],
    ),
  );
}

Future showErrorDialog(context, message) => showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
          title: Text(
            'Alert',
            style: pageTitleStyleError,
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Okay',
                style: mSubHeading,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));

Future showErrorDialogDocubleClose(context, message) => showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
          title: Text(
            'Alert',
            style: pageTitleStyleError,
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Okay',
                style: mSubHeading,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        ));

Future showUPIProcessDialog(context) => showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text(
            "Processing Payment...",
            style: pageTitleStyle,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                height: 16,
              ),
              Text(
                "Please open your UPI app and \ncomplete the payment within 5 minutes.",
                style: pageSubTitleStyle,
              )
            ],
          ),
        ),
      );
    });
