import 'package:maha/app/common/constant/export/export_constant.dart';

class TitleTextFieldConst extends StatelessWidget {
  const TitleTextFieldConst({
    super.key,
    required this.title,
    this.isRequired = false,
  });
  final String title;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: RichText(
          text: TextSpan(
            text: title,
            style: AppStyle.semiBold(fontSize: FontSize.font12),
            children: <TextSpan>[
              if (isRequired == true)
                TextSpan(
                  text: ' *',
                  style: AppStyle.bold(
                    color: AppColor.kRedColor,
                    fontSize: FontSize.font12,
                  ),
                ),
            ],
          ),
        )),
      ],
    );
  }
}
