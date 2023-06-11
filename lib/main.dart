import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodopia/core/data/appwrite_client.dart';
import 'package:foodopia/core/presentation/splash_screen.dart';
import 'package:foodopia/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:foodopia/features/explore/presentation/bloc/explore_user/explore_user_bloc.dart';
import 'package:foodopia/features/post/presentation/bloc/post/post_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  AppWriteClient();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => PostBloc(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ExploreUserBloc(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodopia',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
