import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'attendance/attendance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // disable back button
      onPopInvoked: (bool didPop) async {
        final shouldPop = await _onWillPop(context);
        if (shouldPop) {
          Navigator.of(context).pop(true);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo[800]!,
                  Colors.indigo[600]!,
                ],
              )
          ),
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Eyyo yo what's up der", style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF1FAEE),
                        height: 1.3
                      ),
                    ),),
                    Text("Apa yang lu mao lakuin lee", style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF1FAEE),
                        height: 1.3
                      )
                    ),),
                    const SizedBox(height: 40,),
                    Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,// Lebar per panjang
                          children: [
                            _itemsAttendanceApp(context, iconLer: Icons.camera, title: "Attendance", color: Colors.amberAccent, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()))),
                            _itemsAttendanceApp(context, iconLer: Icons.umbrella_outlined, title: "apa be", color: Colors.amberAccent, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()))),
                            _itemsAttendanceApp(context, iconLer: Icons.architecture_outlined, title: "apa be", color: Colors.amberAccent, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()))),
                            _itemsAttendanceApp(context, iconLer: Icons.leaderboard_outlined, title: "apa be", color: Colors.amberAccent, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()))),
                          ],
                        )
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  Widget _itemsAttendanceApp(BuildContext context,{
    required IconData iconLer,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }){ return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 6,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.indigo[400],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color
                ),
                child: Icon(
                  iconLer,
                  size: 40,
                  color: Color(0xffF1FAEE),
                ),
              ),
              const SizedBox(height: 15,),
              Text(title, style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF1FAEE),
                    letterSpacing: 0.8
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
            title: Text('Confirm Exit'),
            content: Text('Are you sure you want to exit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ]
        )
    ) ?? false;
  }
}