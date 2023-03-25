import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pagee.dart';
import 'app_state.dart';

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
            create: (context) => NewsCubit(ApiP)
        ),}
    }
    
