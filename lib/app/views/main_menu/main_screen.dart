import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maha/app/bloc/bottom_navigator/tab_cubit.dart';
import 'package:maha/app/common/constant/export/export_constant.dart';
import 'package:maha/app/common/query/query.dart';
import 'package:maha/app/router/injection.dart';
import 'package:maha/app/views/auth/auth_screen.dart';
import 'package:maha/app/views/main_menu/add/add_data_screen.dart';
import 'package:maha/app/views/main_menu/home/home_screen.dart';
import 'package:maha/app/views/main_menu/profil/profil_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const id = "/main_screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BottomNavCubit _bottomNavCubit = getIt<BottomNavCubit>();
  final List<IconData> _iconList = [
    AppIcon.kIconHome,
    // AppIcon.kIconPesanan,
    AppIcon.kIconProfil,
  ];

  void _changeSelectedNavBar(int index) {
    _bottomNavCubit.changePage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bottomNavCubit.changePage(2);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<BottomNavCubit, int>(builder: (context, state) {
        if (state == 0) {
          return const HomeScreen();
        } else if (state == 2) {
          return const PostScreen();
        } else if (state == 1) {
          return const ProfilScreen();
        }

        return const AuthScreen();
      }), //destination screen
      // floatingActionButton: widgetFloatingButton(isDarkTheme),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: widgetBottomNavigator(),
    );
  }

  String getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Profil";
      default:
        return "";
    }
  }

  BlocBuilder<BottomNavCubit, int> widgetBottomNavigator() {
    return BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) => Container(
              decoration: const BoxDecoration(
                // borderRadius: const BorderRadius.only(
                //   topLeft: Radius.circular(20),
                //   topRight: Radius.circular(20),
                // ),
                color: AppColor.kWhiteColor,
              ),
              child: AnimatedBottomNavigationBar.builder(
                tabBuilder: (int index, bool isActive) {
                  final color =
                      isActive ? AppColor.kPrimaryColor : AppColor.kGreyColor;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(_iconList[index], size: 24, color: color),
                      isActive
                          ? const SizedBox(height: 4)
                          : const SizedBox(
                              height: 2,
                            ),
                      isActive
                          ? Container(
                              height: 3,
                              width: 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColor.kPrimaryColor),
                            )
                          : const SizedBox(),
                      isActive ? const SizedBox(height: 4) : const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(getTitleByIndex(index),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: AppStyle.medium().copyWith(
                                letterSpacing: 0,
                                color: isActive ? null : AppColor.kGreyColor)),
                      ),
                      spaceHeight02
                    ],
                  );
                },
                elevation: 0,
                activeIndex: state,
                itemCount: _iconList.length,
                onTap: _changeSelectedNavBar,
                gapLocation: GapLocation.none,
                // gapWidth: 0,
                notchSmoothness: NotchSmoothness.defaultEdge,
                notchMargin: -20,
                // notchAndCornersAnimation: borderRadiusAnimation,
                // blurEffect: true,
                height: 70,
                shadow: const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0, 1),
                  blurRadius: 12,
                  spreadRadius: 0.5,
                ),
                leftCornerRadius: 20,
                rightCornerRadius: 20,
                backgroundColor:
                    //  Colors.white
                    getBackgroundColorMain(context),
                // backgroundColor: kPrimaryColor,
              ),
            ));
  }
}
