import 'package:flutter/material.dart';

enum NewOrUpdateStatus { editing, invalid, saving, saved, savingFailed }

extension NewOrUpdateStatusChange on NewOrUpdateStatus {
  void snackBarNotify(BuildContext context) {
    switch (this) {
      case NewOrUpdateStatus.invalid:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter all the data'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1),
          ),
        );
        return;

      case NewOrUpdateStatus.saved:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Saved !'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop<bool>(true);
        return;
      case NewOrUpdateStatus.savingFailed:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Saving Failed !'),
            backgroundColor: Colors.red,
            showCloseIcon: true,
          ),
        );
        return;
      default:
        return;
    }
  }
}
