import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:maha/app/bloc/bloc_observer.dart';
import 'package:maha/app/bloc/bottom_navigator/tab_cubit.dart';
import 'package:maha/app/bloc/user/user_cubit.dart';
import 'package:maha/app/common/constant/export/export_constant.dart';
import 'package:maha/app/config/config.dart';
import 'package:maha/app/router/injection.dart';
import 'package:maha/app/router/router.dart';
import 'package:maha/app/utils/components/loading/custom_animation.dart';
import 'package:maha/app/utils/theme/input_decoration_field.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  HydratedStorage storage;

  if (kIsWeb) {
    // Use web-specific storage for web platform
    storage = await HydratedStorage.build(
      storageDirectory: HydratedStorage.webStorageDirectory,
    );
  } else {
    // For non-web platforms
    final tempDir = await getTemporaryDirectory();
    storage = await HydratedStorage.build(
      storageDirectory: tempDir,
    );
  }

  HydratedBloc.storage = storage;
  Bloc.observer = MyBlocObserver();
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..backgroundColor = AppColor.kTransparentColor
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..userInteractions = false
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorColor = Colors.transparent
    // ..indicatorColor = AppColor.kWhiteColor
    ..boxShadow = []
    ..textColor = AppColor.kWhiteColor
    ..progressColor = AppColor.kWhiteColor
    ..maskType = EasyLoadingMaskType.custom
    ..customAnimation = CustomAnimation()
    ..maskColor = AppColor.kWhiteColor.withOpacity(0.5);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        // designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => GestureDetector(
              onTap: () => primaryFocus?.unfocus(),
              child: MultiBlocProvider(
                  providers: [
                    BlocProvider<BottomNavCubit>(
                      create: (_) => getIt.get<BottomNavCubit>(),
                    ),
                    BlocProvider<UserCubit>(
                      create: (_) => getIt.get<UserCubit>(),
                    ),
                  ],
                  child: MaterialApp.router(
                    title: 'maha',
                    debugShowCheckedModeBanner: false,
                    routerDelegate: RouterGenerator.router.routerDelegate,
                    routeInformationParser:
                        RouterGenerator.router.routeInformationParser,
                    routeInformationProvider:
                        RouterGenerator.router.routeInformationProvider,
                    // onGenerateRoute: RouterGenerator.generateRoute,
                    // initialRoute: SplashScreen.id,
                    builder: EasyLoading.init(),
                    theme: themeData(),
                  )),
            ));
  }

  ThemeData themeData() {
    return ThemeData(
        scaffoldBackgroundColor: AppColor.kWhiteColor,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColor.kPrimaryColor,
            foregroundColor: AppColor.kWhiteColor),
        appBarTheme: AppBarTheme(
            centerTitle: false,
            titleTextStyle: AppStyle.semiBold(
                color: AppColor.kWhiteColor, fontSize: FontSize.font16),
            iconTheme: const IconThemeData(color: AppColor.kWhiteColor),
            backgroundColor: AppColor.kPrimaryColor),
        fontFamily: Config.fontFamilyPrimary,
        primaryColor: AppColor.kPrimaryColor,
        // splashColor: AppColor.kPrimaryColor,
        primaryColorLight: AppColor.kPrimaryColor,
        inputDecorationTheme: customInputDecorationTheme(),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                textStyle: AppStyle.medium(),
                splashFactory: InkRipple.splashFactory)));
  }
}
