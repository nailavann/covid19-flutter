import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class Dialogs {
  static void noHeaderDialog(BuildContext context,String? title,String? desc,Function? btnCancel, Function? btnOk){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnCancelOnPress: btnCancel,
      btnOkOnPress: btnOk,
      btnCancelText: "Cancel",
      btnOkText: "Ok",
    )..show();
  }

  static void warningDialog(BuildContext context, String? title, String? desc,
      Function? btnCancel, Function? btnOk){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnCancelOnPress: btnCancel,
      btnCancelText: "Cancel",
      btnOkOnPress: btnOk,
      btnOkText:"Ok",
    )..show();
  }
}