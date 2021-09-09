import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Progress{
  static Future<ProgressDialog> showLoadingDialog(BuildContext context,String message) async{
    ProgressDialog dialog = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: false);
    dialog.style(message: message);
    return dialog;
  }
}