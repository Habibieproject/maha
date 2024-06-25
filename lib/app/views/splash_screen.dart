import 'package:go_router/go_router.dart';
import 'package:maha/app/common/constant/export/export_constant.dart';
import 'package:maha/app/common/extension/context.dart';
import 'package:maha/app/common/query/query.dart';
import 'package:maha/app/config/config.dart';
import 'package:maha/app/views/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = "/";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(AuthScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: AppColor.kWhiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            spaceHeight01,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImage.kImageLogoPNG,
                      width: context.screenWidth * 0.4,
                      // height: 50,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Config.splashText,
                      style: AppStyle.bold(fontSize: FontSize.font24),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Config.version,
                  style: AppStyle.bold(fontSize: FontSize.font12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
