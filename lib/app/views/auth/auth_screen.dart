import 'package:go_router/go_router.dart';
import 'package:maha/app/common/constant/export/export_constant.dart';
import 'package:maha/app/common/extension/sizedbox.dart';
import 'package:maha/app/common/query/query.dart';
import 'package:maha/app/config/config.dart';
import 'package:maha/app/utils/widgets/default_button.dart';
import 'package:maha/app/utils/widgets/text_field.dart';
import 'package:maha/app/utils/widgets/title_field.dart';
import 'package:maha/app/views/main_menu/main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const id = "/auth_screen";
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: sizePaddingAll(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              spaceHeight1,
              Center(
                child: Image.asset(
                  AppImage.kImageLogoPNG,
                  height: context.sizeHeight * 0.2,
                  fit: BoxFit.contain,
                ),
              ),
              spaceHeight02,
              Center(
                child: Text(
                  Config.appName,
                  style: AppStyle.bold(
                      fontFamily: Config.fontFamilyStyle,
                      fontSize: FontSize.font24),
                ),
              ),
              spaceHeight1,
              const TitleTextFieldConst(
                title: "Email",
              ),
              spaceHeight02,
              CustomTextField(
                  hintText: "Masukkan Email Anda",
                  isPassword: false,
                  prefixIcon: iconSVGMethod(AppIcon.emailSVG),
                  suffixIcon: null,
                  controller: emailController),
              spaceHeight04,
              const TitleTextFieldConst(
                title: "Password",
              ),
              spaceHeight02,
              CustomTextField(
                hintText: "Masukkan Password Anda",
                isPassword: true,
                prefixIcon: iconSVGMethod(AppIcon.passwordSVG),
                suffixIcon: null,
                controller: passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // context.router.push(const ResetPasswordRoute());
                  },
                  child: Text(
                    "Lupa Password?",
                    style: AppStyle.medium(fontSize: FontSize.font12),
                  ),
                ),
              ),
              spaceHeight05,
              Row(
                children: [
                  DefaultButton(
                    text: "Masuk",
                    onPressed: () {
                      context.pushReplacementNamed(MainScreen.id);
                    },
                  ),
                ],
              ),
              spaceHeight04,
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text.rich(
                    TextSpan(
                      text: 'Belum punya akun? ',
                      style: AppStyle.medium(),
                      children: [
                        TextSpan(
                            text: 'Daftar Sekarang',
                            style: AppStyle.bold(
                              color: AppColor.kPrimaryColor,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              spaceHeight04,
              // const Center(
              //   child: Text.rich(
              //     TextSpan(
              //       text: 'Dengan ini saya menyetujui dengan ',
              //       style: TextStyle(color: Colors.black),
              //       children: [
              //         TextSpan(
              //           text: 'Syarat & Ketentuan',
              //           style: TextStyle(color: Colors.orange),
              //         ),
              //         TextSpan(
              //           text: ' serta ',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //         TextSpan(
              //           text: 'Kebijakan Privasi',
              //           style: TextStyle(color: Colors.orange),
              //         ),
              //         TextSpan(
              //           text: ' yang berlaku',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ],
              //     ),
              // textAlign: TextAlign.center,
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
