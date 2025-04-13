import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vire_glof/colors.dart';

Widget commonText(
  String text, {
  double size = 12.0,
  Color color = Colors.black,
  bool isBold = false,
  softwarp,
  fontWeight,
  TextAlign textAlign = TextAlign.left,
}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: 1000,
    softWrap: softwarp,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight:
          isBold
              ? FontWeight.bold
              : (fontWeight != null)
              ? fontWeight
              : FontWeight.normal,
    ),
  );
}

Widget commonTextfieldWithTitle(
  String title,
  TextEditingController controller, {
  FocusNode? focusNode,
  String hintText = "",
  bool isBold = true,
  bool issuffixIconVisible = false,
  bool isPasswordVisible = false,
  enable,
  textSize = 14.0,
  suffixIcon,
  borderWidth = 0.0,
  optional = false,
  changePasswordVisibility,
  TextInputType keyboardType = TextInputType.text,
  String? assetIconPath,
  Color borderColor = Colors.grey,
  int maxLine = 1,
  String? Function(String?)? onValidate,
  Function(String?)? onFieldSubmit,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(title, size: textSize, fontWeight: FontWeight.w500),
          if (optional)
            commonText("(Optional)", size: textSize, color: Colors.grey),
        ],
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(-6, 0),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(6, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: TextFormField(
            controller: controller,
            enabled: enable,
            focusNode: focusNode,
            validator: onValidate,
            onFieldSubmitted: onFieldSubmit,
            keyboardType: keyboardType,
            maxLines: maxLine,
            obscureText: isPasswordVisible,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12.0),
              hintText: hintText,
              fillColor: AppColors.white,
              filled: true,
              hintStyle: TextStyle(fontSize: 12, color: AppColors.gray),
              border: InputBorder.none,
              suffixIcon:
                  (issuffixIconVisible)
                      ? (!isPasswordVisible)
                          ? InkWell(
                            onTap: changePasswordVisibility,
                            child: Icon(Icons.visibility),
                          )
                          : InkWell(
                            onTap: changePasswordVisibility,
                            child: Icon(Icons.visibility_off_outlined),
                          )
                      : suffixIcon,
              prefixIcon:
                  assetIconPath != null
                      ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ImageIcon(AssetImage(assetIconPath), size: 24.0),
                      )
                      : null,
            ),
          ),
        ),
      ),
    ],
  );
}

void navigateToPage(
  Widget page, {
  bool replace = false,
  bool clearStack = false,
  Transition transition = Transition.rightToLeft,
  Duration duration = const Duration(milliseconds: 400),
}) {
  if (clearStack) {
    Get.offAll(page, transition: transition, duration: duration);
  } else if (replace) {
    Get.off(page, transition: transition, duration: duration);
  } else {
    Get.to(page, transition: transition, duration: duration);
  }
}

Widget commonButton(
  String title, {
  Color? color,
  Color textColor = Colors.white,
  double textSize = 18,
  double width = double.infinity,
  double height = 50,
  VoidCallback? onTap,
  bool isLoading = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: (color != null) ? color : null,
        gradient: (color != null) ? null : AppColors.primaryGradient,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              isLoading
                  ? const CircularProgressIndicator()
                  : commonText(
                    title,
                    size: textSize,
                    color: textColor,
                    isBold: true,
                  ),
        ),
      ),
    ),
  );
}

Widget commonBorderButton(
  String title, {
  double width = double.infinity,
  double height = 50,
  VoidCallback? onTap,
  String? imagePath,
  double imageSize = 20.0,
  Color textColor = AppColors.black,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,

      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient, // outer gradient border
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(1.5), // space for the gradient border
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white, // inner background color
          borderRadius: BorderRadius.circular(14), // slightly smaller radius
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagePath != null) ...[
                Image.asset(
                  imagePath,
                  height: imageSize,
                  width: imageSize,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
              ],
              commonText(title, size: 18, color: textColor, isBold: true),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildOTPTextField(
  TextEditingController controller,
  int index,
  BuildContext context,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 6,
          offset: const Offset(-3, 0),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 6,
          offset: const Offset(3, 0),
        ),
      ],
    ),
    width: 55,
    height: 55,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 20),
      maxLength: 1,
      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        if (value.length == 1 && index < 5) {
          FocusScope.of(context).nextFocus();
        } else if (value.isEmpty && index > 0) {
          FocusScope.of(context).previousFocus();
        }
      },
    ),
  );
}
