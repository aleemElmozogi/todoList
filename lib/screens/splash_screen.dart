import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inject/utils/app_colors.dart';

import '../cubit_observer.dart';
import '../data/data_source/mongodb.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulating an async task with a delay
    await Future.delayed(Duration(seconds: 1));
    WidgetsFlutterBinding.ensureInitialized();

    await MongodbHelper.connect();

    Bloc.observer = MyBlocObserver();
    retryIf:
    (e) => e is SocketException || e is TimeoutException;

    setState(() {
      _isLoading = false;
    });

    // Navigate to the home page or any other page
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.flutter_dash_sharp,
            size: 65,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: _isLoading
                ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
