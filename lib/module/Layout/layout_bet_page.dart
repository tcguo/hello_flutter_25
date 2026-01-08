import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutBetPage extends StatefulWidget {
  const LayoutBetPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LayoutBetPageState();
  }
}

class _LayoutBetPageState extends State<LayoutBetPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("bet inner page")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.black26,
                  height: 132,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("[10]", style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.4)),),
                          const SizedBox(height: 4,),
                          Container(
                            alignment:  Alignment.center,
                            width: 48,
                            height: 48,
                            child: Image(image: AssetImage("images/liverpool.png")),
                          ),
                          ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 136),
                              child: Text("Tha Bangkok Women", textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),)
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("[10]", style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.4)),),
                          const SizedBox(height: 4,),
                          Container(
                            alignment:  Alignment.center,
                            width: 48,
                            height: 48,
                            child: Image(image: AssetImage("images/bet_team2_icon.png")),
                          ),
                          ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 136, minWidth: 12),
                              child: Text("Tha Bangkok Women", textAlign: TextAlign.center,  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),)
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: (MediaQuery.of(context).size.width-97)/2,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            color: Colors.green.shade200,
                            width: 50,
                            height: 24,
                            child: Image.asset("images/bet_component1.png", width: 16, height: 16,)
                          ),
                          SizedBox(width: 1),
                          Container(
                              alignment: Alignment.center,
                              color: Colors.green.shade200,
                              width: 50,
                              height: 24,
                              child: Image.asset("images/bet_component2.png", width: 16, height: 16,)
                          )
                        ],
                      ),
                    )
                )
              ]
            ),
            Container(
              height: 240,
              color: Colors.yellow.shade200,
            )
          ],
        ),
      ),
    );
  }
}