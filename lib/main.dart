import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modules/check_out/check_out_provider.dart';
import 'package:food_app/modules/home/home_controller/product_controller.dart';
import 'package:food_app/modules/products/review_cart/review_cart_controller.dart';
import 'package:food_app/modules/products/wishlist/wishlist_controller.dart';
import 'package:food_app/modules/theme/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:food_app/modules/auth/auth_controller/auth_controller.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:food_app/utils/routes/routes.dart';
import 'package:food_app/utils/routes/routes_name.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => ReviewCartController()),
        ChangeNotifierProvider(create: (_) => WishListController()),
        ChangeNotifierProvider(create: (_) => CheckoutProvider()),
      ],
      child: Consumer<ThemeController>(builder: (context, value, child) {
        // debugPrint("dark theme = ${value.isDarkMode}");
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themedata.getThemData(value.isDarkMode),
          initialRoute: RouteName.homeScreen,
          onGenerateRoute: Routes.generateRoute,
        );
      }),
    );
  }
}
