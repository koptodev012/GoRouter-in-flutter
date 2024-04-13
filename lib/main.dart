import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/route%20names/router_name.dart';
import 'package:go_router_flutter/view/dashboard_screen.dart';
import 'package:go_router_flutter/view/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Go Router',
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(routes: [
// Normal naviagate
    GoRoute(
      name: RouteNames.dashboard,
      path: "/",
      builder: (context, state) => const Dashboard(),
    ),

// add Animation to naviagte
    GoRoute(
      name: RouteNames.profile,
      path: "/profile",
      pageBuilder: (context, state) {
        
        return CustomTransitionPage(
          transitionDuration: Duration(seconds: 4),
            child: Profile(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            });
      },
    ),
  ]);
}
