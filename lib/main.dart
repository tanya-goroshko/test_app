import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: BlocProvider<ColorCubit>(
            create: (context) => ColorCubit(),
            child: BlocBuilder<ColorCubit, Color>(builder: (context, color) {
              return GestureDetector(
                onTap: () {
                  context.read<ColorCubit>().changeColorOnClick();
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: color),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tight(Size(width, height)),
                        child: MouseRegion(
                            onHover: (details) {
                              {
                                context.read<ColorCubit>().changeColorOnHover(
                                    details.position.dx,
                                    details.position.dy,
                                    height,
                                    width);
                              }
                            },
                            child: Center(
                                child: Text('Hey there',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 40,
                                        fontFamily: 'Audiowide')))),
                      ),
                    ),
                    Positioned(
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Text(
                            "Try to click on background and move mouse to change a background color.",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 22,
                                fontFamily: 'Audiowide'),
                          )),
                    )
                  ],
                ),
              );
            })));
  }
}
