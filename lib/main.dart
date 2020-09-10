import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new _homepage(),
    );
  }
}
class _homepage extends StatefulWidget {
  @override
  __homepageState createState() => __homepageState();
}

class __homepageState extends State<_homepage> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
    duration: new Duration(milliseconds: 450));
    _iconAnimation = new CurvedAnimation(parent:_iconAnimationController, curve:Curves.easeOut);
    _iconAnimation.addListener(()=> this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body:new Stack(
        fit:StackFit.expand,
        children: [
          new Image(image: new AssetImage("assets/pexels.jpg"),
          fit: BoxFit.cover,
            color:Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new FlutterLogo(size: _iconAnimation.value * 100,),
              new Form(
                child:new Theme(data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                ),
                    child:new Container(
                        padding: const EdgeInsets.all(40.0,),
                        child:new Column(
                          children: [
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Enter Email",
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Enter Password",
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            new Padding(padding: const EdgeInsets.only(top: 20.0,)),
                            new MaterialButton(
                              color: Colors.teal,
                              textColor: Colors.white70,
                              child: new Text("Login"),
                              onPressed: ()=>{},
                              splashColor: Colors.redAccent,)

                          ],
                        )
                    )
                ),



              )
            ],
          )
        ],
      )
    );
  }
}
