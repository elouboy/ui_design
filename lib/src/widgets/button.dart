import 'package:ui_design/src/shared/styles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final Color primaryColor;
  final Color mediumGreyColor;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;

  const Button({
    Key? key,
    required this.title,
    required this.primaryColor,
    this.mediumGreyColor = const Color(0xff868686),
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
  })  : outline = false,
        super(key: key);

   const Button.outline({
    Key? key,
    required this.title,
    required this.primaryColor,
    this.mediumGreyColor = const Color(0xff868686),
    this.onTap,
    this.leading,
  })  : disabled = false,
        busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? primaryColor : mediumGreyColor,
                borderRadius: BorderRadius.circular(8),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: primaryColor,
                  width: 1,
                )),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) const SizedBox(width: 5),
                  Text(
                    title,
                    style: bodyStyle.copyWith(
                      fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                      color: !outline ? Colors.white : primaryColor,
                    ),
                  ),
                ],
              )
            : const CircularProgressIndicator(
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
      ),
    );
  }
}