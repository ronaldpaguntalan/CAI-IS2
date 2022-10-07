import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/top_header.png')
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage('https://cdn5.vectorstock.com/i/1000x1000/52/54/male-student-graduation-avatar-profile-vector-12055254.jpg'),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Student Name', style: TextStyle(fontFamily: 'Montserrat Meduim', color: Colors.white, fontSize: 20),),
                            Text('1011800351', style: TextStyle(fontFamily: 'Montserrat Meduim', color: Colors.white, fontSize: 14),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisCount: 10,
                    primary: false,
                    children: [
                      Card(
                        child: Column(
                          children: [
                            SvgPicture.network('https://image.flaticon.com/icons/svg/1904/1904425.svg')
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
