import 'package:getx_boiler_plate/features/authentication/login/controller/login_controller.dart';
import 'package:getx_boiler_plate/features/widgets/custom_elevated_button.dart';
import 'package:getx_boiler_plate/features/widgets/custom_text_form_field.dart';
import 'package:getx_boiler_plate/localizations/app_localization.dart';
import 'package:getx_boiler_plate/theme/app_styles.dart';
import 'package:getx_boiler_plate/theme/colors.dart';
import 'package:getx_boiler_plate/theme/custom_button_style.dart';
import 'package:getx_boiler_plate/utils/size_utils.dart';
import 'package:getx_boiler_plate/validators/validation_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() {
          return Form(
            key: _formKey,
            autovalidateMode: controller.onSubmit.value
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 11.v),
              child: Container(
                margin: EdgeInsets.only(bottom: 5.v),
                padding: EdgeInsets.symmetric(horizontal: 32.h),
                child: Column(
                  children: [
                    _buildPageHeader(context),
                    SizedBox(height: 21.v),
                    SizedBox(height: 115.v),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "lbl_username".tr,
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value == null ||
                            (!isUsername(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_username".tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.v),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: "lbl_password".tr,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      onChanged: (value) {
                        // setState(() {});
                      },
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_password".tr;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 26.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "msg_forgot_password".tr,
                          style: CustomTextStyles.labelLarge
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 55.v),
                    CustomElevatedButton(
                      text: "lbl_next".tr,
                      buttonStyle: CustomButtonStyles.fillBlue,
                      buttonTextStyle: CustomTextStyles.titleMedium.copyWith(
                        color: secondaryTextColor,
                        fontSize: 16.fSize,
                      ),
                      isLoading:
                      controller.status.value == LoginStatus.loading
                          ? true
                          : false,
                      onPressed: () {
                        controller.onSubmit.value = true;
                        if (_formKey.currentState!.validate()) {
                          controller.login(
                              emailController.text, passwordController.text);
                        }
                      },
                    ),
                    SizedBox(height: 28.v),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Text("msg_don_t_have_an_account".tr,
                                style: CustomTextStyles.labelLarge),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              "lbl_sign_up".tr,
                              style: CustomTextStyles.labelLarge
                                  .copyWith(
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Section Widget
Widget _buildPageHeader(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 221.h,
        margin: EdgeInsets.only(top: 55.v, right: 89.h),
        child: Text(
          "lbl_login".tr,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.displaySmall.copyWith(height: 1.18),
        ),
      ),
      SizedBox(height: 1.v),
      Container(
        width: 282.h,
        margin: EdgeInsets.only(right: 28.h),
        child: Text(
          "msg_lorem_ipsum_dolor".tr,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.labelLarge.copyWith(height: 1.67),
        ),
      )
    ],
  );
}
