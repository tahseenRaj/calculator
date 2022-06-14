import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Array of button
  final List<String> operations = ['C','+/-','%','\u{232B}','7','8','9','/','4','5','6','\u00d7','1','2','3','-','0','.','=','+',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              // color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('16589+15451+1545/56*6452', maxLines: 1, overflow: TextOverflow.fade, style: GoogleFonts.robotoSlab(fontSize: 40, letterSpacing: 1),),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              // color: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.centerRight,
              child: Text('210046.0714', maxLines: 1, overflow: TextOverflow.clip, style: GoogleFonts.robotoSlab(fontSize: 50, letterSpacing: 1),),
            ),
            const Divider(color: Colors.black,),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: operations.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.black12),
                        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                          return RoundedRectangleBorder(borderRadius: BorderRadius.circular(50));
                        }),
                      ),
                      onPressed: () {
                        print('You have clicked ${operations[index]}');
                      },
                      child: Center(child: Text(operations[index], style: GoogleFonts.robotoSlab(fontSize: 35, color: Colors.black),))),
                  );
                }
              )
            )
          ],
        )
      ),);
  }
}
