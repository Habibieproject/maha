import 'package:go_router/go_router.dart';
import 'package:maha/app/common/constant/export/export_constant.dart';
import 'package:maha/app/common/query/query.dart';
import 'package:maha/app/utils/widgets/default_button.dart';
import 'package:maha/app/views/auth/auth_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});
  static const id = "/profil_screen";
  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: sizePaddingAll(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Terima Kasih untuk hari ini",
            style: AppStyle.bold(),
          ),
          spaceHeight04,
          Row(
            children: [
              DefaultButton(
                text: "Keluar",
                onPressed: () {
                  context.goNamed(AuthScreen.id);
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}
