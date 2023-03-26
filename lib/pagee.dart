import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_hack_app/state/app_state.dart';
import 'package:health_hack_app/state/cubitt.dart';
class Pagee extends StatefulWidget {
  const Pagee({Key? key}) : super(key: key);

  @override

  State<Pagee> createState() => _PageeState();
}

class _PageeState extends State<Pagee> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit= context.read<NewsCubit>();
      cubit.fetchNewss();
    });
  }
 @override
  Widget build(BuildContext context) {
    double heigh = MediaQuery.of(context).size.height;
    double widt = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
      Scaffold(
        appBar:
        AppBar(
          backgroundColor: Colors.black54,
          elevation: 2,
          title:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top News',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: widt*0.45,
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.search,
                    color: Colors.white,
                    size: 37,),

                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],

          selectedItemColor: Colors.amber[800],

        ),
        backgroundColor: Colors.black87,
        body:

          BlocBuilder<NewsCubit,NewsState>(
            builder:(context,state){
              if(state is InitNewsState|| state is LoadingNewsState){


                return const Center(
                     child: CircularProgressIndicator(),
                );
              }else if(state is ResponseNewsState)
                {
                  if (kDebugMode) {
                    print('hello');
                  }
                  final newss= state.newss;

                  return ListView.builder(


                    itemCount: 12,
                    itemBuilder: (context,index){
                    final newsss= newss[index];

                     return Column(
                       children: [

                         SizedBox(
                             height: heigh*0.05
                         ),
                         SizedBox(
                           height: heigh * 0.24,
                           width: widt * 0.89,
                           child: Card(
                             color: Color(0xFF202020),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15.0),
                             ),
                             child:  Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 SizedBox(
                                     height: heigh*0.5,
                                     width: widt * 0.3,
                                     child: Image.network(newsss.img_url)),

                                 Expanded(
                                   child: ListView(
                                     children:<Widget> [ Text(newsss.title,
                                       style: GoogleFonts.ptSans(
                                         textStyle: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontSize: 20,
                                           color: Colors.white,
                                         ),
                                       ),
                                     ),
                                       Text(newsss.author,
                                         style: GoogleFonts.ptSans(
                                           textStyle: TextStyle(
                                             fontSize: 17,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ),
                                       Text(newsss.description,
                                         style: GoogleFonts.ptSans(
                                           textStyle: TextStyle(
                                             fontSize: 17,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ),
                                       // Text('Content',
                                       //   style: GoogleFonts.ptSans(
                                       //     textStyle: TextStyle(
                                       //       fontSize: 20,
                                       //       color: Colors.white,
                                       //     ),
                                       //   ),
                                       // ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         // SizedBox(
                         //     height: heigh*0.05
                         // ),
                         // SizedBox(
                         //   height: heigh * 0.25,
                         //   width: widt * 0.89,
                         //   child: Card(
                         //     color: Color(0xFF202020),
                         //     shape: RoundedRectangleBorder(
                         //       borderRadius: BorderRadius.circular(15.0),
                         //     ),
                         //     child:  Row(
                         //       crossAxisAlignment: CrossAxisAlignment.start,
                         //       children: <Widget>[
                         //         SizedBox(
                         //             height: heigh*0.6,
                         //             width: widt * 0.3,
                         //             child: Image.network(newsss.img_url)),
                         //
                         //         Expanded( child:ListView(
                         //           children:<Widget> [ Text(newsss.title,
                         //             style: GoogleFonts.ptSans(
                         //               textStyle: TextStyle(
                         //                 color: Colors.white,
                         //                 fontWeight: FontWeight.w600,
                         //                 fontSize: 20,
                         //               ),
                         //             ),
                         //           ),
                         //             Text(newsss.author,
                         //               style: GoogleFonts.ptSans(
                         //                 textStyle: TextStyle(
                         //                   color: Colors.white,
                         //                   fontSize: 17,
                         //                 ),
                         //               ),
                         //             ),
                         //             Text(newsss.description,
                         //               style: GoogleFonts.ptSans(
                         //                 textStyle: TextStyle(
                         //                   color: Colors.white,
                         //                   fontSize: 17,
                         //                 ),
                         //               ),
                         //             ),
                         //             // Text('Content',
                         //             //   style: GoogleFonts.ptSans(
                         //             //     textStyle: TextStyle(
                         //             //       color: Colors.white,
                         //             //       fontSize: 20,
                         //             //     ),
                         //             //   ),
                         //             // ),
                         //           ],
                         //         ),
                         //         ),
                         //       ],
                         //     ),
                         //   ),
                         // ),
                         // SizedBox(
                         //     height: heigh*0.05
                         // ),
                         // SizedBox(
                         //   height: heigh * 0.25,
                         //   width: widt * 0.89,
                         //   child: Card(
                         //     color: Color(0xFF202020),
                         //     shape: RoundedRectangleBorder(
                         //       borderRadius: BorderRadius.circular(15.0),
                         //     ),
                         //     child:  Row(
                         //       crossAxisAlignment: CrossAxisAlignment.start,
                         //       children: <Widget>[
                         //         SizedBox(
                         //             height: heigh*0.6,
                         //             width: widt * 0.3,
                         //             child: Image.network(newsss.img_url)),
                         //
                         //         Expanded(
                         //           child: ListView(
                         //             children:<Widget> [ Text(newsss.title,
                         //               style: GoogleFonts.ptSans(
                         //                 textStyle: TextStyle(
                         //                   color: Colors.white,
                         //                   fontWeight: FontWeight.w600,
                         //                   fontSize: 20,
                         //                 ),
                         //               ),
                         //             ),
                         //               Text(newsss.author,
                         //                 style: GoogleFonts.ptSans(
                         //                   textStyle: TextStyle(
                         //                     color: Colors.white,
                         //                     fontSize: 17,
                         //                   ),
                         //                 ),
                         //               ),
                         //               Text(newsss.description,
                         //                 style: GoogleFonts.ptSans(
                         //                   textStyle: TextStyle(
                         //                     color: Colors.white,
                         //                     fontSize: 17,
                         //                   ),
                         //                 ),
                         //               ),
                         //               // Text('Content',
                         //               //   style: GoogleFonts.ptSans(
                         //               //     textStyle: TextStyle(
                         //               //       fontSize: 20,
                         //               //       color: Colors.white,
                         //               //     ),
                         //               //   ),
                         //               // ),
                         //             ],
                         //           ),
                         //         ),
                         //       ],
                         //     ),
                         //   ),
                         // ),
                       ],
                     );


                    },
                  );
                }

              return Center(child:Text(state.toString()));
            } ,


          ),


      ),
    ],
    );
  }
}
