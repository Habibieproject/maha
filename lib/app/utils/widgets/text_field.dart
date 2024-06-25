import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:maha/app/common/constant/export/export_constant.dart';

class CustomTextField extends StatefulWidget {
  final bool readOnly;
  final String hintText;
  final bool isPassword;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool payment; // Add payment parameter
  final bool prefixPhone;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.prefixText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.payment = false, // Default is false
    this.prefixPhone = false,
    this.validator,
    this.readOnly = false,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      style: AppStyle.regular(),
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.payment ? TextInputType.number : widget.keyboardType,
      inputFormatters:
          widget.payment ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        prefixText: widget.prefixText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? InkWell(
                borderRadius: BorderRadius.circular(50.0),
                child: _obscureText
                    ? iconSVGMethod(AppIcon.visibilityOff)
                    : iconSVGMethod(AppIcon.visibilityOn),

                // Icon(
                //   _obscureText ? Icons.visibility_off : Icons.visibility,
                // ),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
      onChanged: widget.payment ? _formatCurrency : null,
    );
  }

  void _formatCurrency(String value) {
    if (value.isEmpty) {
      widget.controller?.text = '';
      return;
    }

    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.', decimalDigits: 0);
    final newValue =
        formatter.format(int.parse(value.replaceAll(RegExp(r'[^0-9]'), '')));

    widget.controller?.value = TextEditingValue(
      text: newValue,
      selection: TextSelection.collapsed(offset: newValue.length),
    );
  }
}
