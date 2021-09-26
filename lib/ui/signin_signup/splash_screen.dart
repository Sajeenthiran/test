import 'package:flutter/material.dart';
import 'package:pos/networking/shared_preference.dart';
import 'package:pos/ui/signin_signup/login_screen.dart';

import '../../main.dart';

/*
void main() {
  runApp(const SplashScreen());
}
*/

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-1.0, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCubic,
  ));

  @override
  void initState() {

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        startMainScreen();
      }
    });
    super.initState();
  }

  void startMainScreen()async{
    if(await MySharedPreferences.instance.getIsLogin("isLogin")){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'test',)));
      //Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
      //await Navigator.pushReplacementNamed(context, '/main');
    }else{
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //await Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("POS Hva Monster") /*Image(image: AssetImage('images/logo.png')),*/
      ),
    );
  }
}
