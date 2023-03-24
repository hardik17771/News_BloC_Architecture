import 'package:flutter/material.dart';
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
        return  MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: Pagee(),
        );
      }
    }
    
