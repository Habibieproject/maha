import 'package:flutter/material.dart';
import 'package:maha/app/common/constant/app_color.dart';
import 'package:maha/app/common/constant/app_style.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? isOutline;

  const DefaultButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: isOutline == true
            ? ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 8)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: AppColor.kBlackColor,
                    ),
                  ),
                ),
              )
            : ElevatedButton.styleFrom(
                backgroundColor: AppColor.kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
        child: Text(
          text,
          style: AppStyle.semiBold(
              color: isOutline == true
                  ? AppColor.kBlackColor
                  : AppColor.kWhiteColor),
        ),
      ),
    );
  }
}
