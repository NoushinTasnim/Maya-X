import 'package:flutter/material.dart';
import 'package:maya_x/components/text_fields.dart';

class TextInputFiledsWidget extends StatelessWidget {
  const TextInputFiledsWidget({
    super.key,
    required this.phoneController,
    required this.passwordController,
    this.userController,
  });

  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController? userController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        userController != null ? Column(
          children: [
            SizedBox(
              height: 32,
            ),
            TextFieldWidget(
              iconData: Icons.person_outline,
              text: 'নাম',
              keyboardType: TextInputType.name,
              textInputController: userController ?? phoneController,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ) : SizedBox(
          height: 32,
        ),
        TextFieldWidget(
          text: 'ফোন নম্বর',
          iconData: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          textInputController: phoneController,
        ),
        const SizedBox(
          height: 16,
        ),
        TextFieldWidget(
          iconData: Icons.lock_outline,
          text: 'পাসওয়ার্ড',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          textInputController: passwordController,
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}