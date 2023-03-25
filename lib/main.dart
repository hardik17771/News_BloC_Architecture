import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_hack_app/repository/api.dart';
import 'package:health_hack_app/state/cubitt.dart';
import 'pagee.dart';


void main() => runApp(const HomePage());
    
    class HomePage extends StatefulWidget {
      const HomePage({Key? key}) : super(key: key);
    
      @override
      State<HomePage> createState() => _HomePageState();
    }
    
    class _HomePageState extends State<HomePage> {
      @override
      Widget build(BuildContext context) {
        return BlocProvider(
          create: (context) => NewsCubit(ApiProvider()),
          child: const MaterialApp(
            home: Pagee(),
          ),

        );
      }
    }
    
