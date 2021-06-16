import 'package:flutter/material.dart';

class AppButtonStyles {
  //Primary Button Style
  static ButtonStyle primaryButtonStyle(BuildContext context) {
    return ButtonStyle(
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled))
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            side: BorderSide(color: Theme.of(context).colorScheme.primary.withOpacity(0.54)),
          );
        else {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
          );
        }
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled))
            return Theme.of(context).colorScheme.primary.withOpacity(0.54);
          else {
            return Theme.of(context).colorScheme.primary;
          }
        },
      ),
    );
  }
}
