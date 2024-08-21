import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/core/constants/app_colors.dart';

class PrimaryTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool isObscureText;
  final bool isTextArea;
  final bool isEnabled;
  final bool autofocus;
  final bool readOnly;
  final Color fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? labelIcon;
  final TextInputType inputType;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;

  const PrimaryTextField({
    super.key,
    this.labelText,
    this.initialValue,
    this.isObscureText = false,
    this.isTextArea = false,
    this.readOnly = false,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.controller,
    this.onTap,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.labelIcon,
    this.textInputAction = TextInputAction.next,
    this.fillColor = AppColors.black30,
    this.autofocus = false,
    this.hintText,
    this.padding,
    this.onFieldSubmitted,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool isVisibleText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  if (widget.labelIcon != null) ...[
                    widget.labelIcon!,
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                  Text(
                    widget.labelText!,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
          TextFormField(
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // textDirection: widget.inputType == TextInputType.phone
            //     ? TextDirection.ltr
            //     : widget.controller != null
            //         ? widget.controller!.text.isNotEmpty && !RegexValidator.isOnlySpaces(widget.controller!.text)
            //             ? RegexValidator.startsWithEnglishChar(widget.controller!.text)
            //                 ? TextDirection.ltr
            //                 : TextDirection.rtl
            //             : TextDirection.ltr
            //         : TextDirection.ltr,
            controller: widget.controller,
            onTap: widget.onTap,
            textInputAction: widget.textInputAction,
            autofocus: widget.autofocus,
            onChanged: (value) {},
            initialValue: widget.initialValue,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.black,
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.gray,
                  ),
              filled: true,
              fillColor: widget.fillColor,
              errorMaxLines: 3,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ??
                  (widget.isObscureText
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisibleText = !isVisibleText;
                            });
                          },
                          icon: isVisibleText
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppColors.gray,
                                )
                              : const Icon(
                                  Icons.visibility_outlined,
                                  color: AppColors.gray,
                                ),
                        )
                      : null),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.gray,width: 1,),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.gray,width: 1,),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.gray,width: 1,),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColors.gray,width: 1,),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            ),
            keyboardType: widget.inputType,
            obscureText: widget.isObscureText && !isVisibleText,
            maxLines: widget.isTextArea ? 4 : 1,
            minLines: widget.isTextArea ? 3 : 1,
            readOnly: widget.readOnly || widget.onTap != null,
            enabled: widget.isEnabled,
          ),
        ],
      ),
    );
  }
}
