import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutStackPage extends StatefulWidget {
  const LayoutStackPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LayoutStackPageState();
  }
}

class _LayoutStackPageState extends State<LayoutStackPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("stack"),),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 350,
          // height: 500,
          padding: const EdgeInsets.only(left: 10, right: 10),
          clipBehavior: Clip.none,
          color: Colors.red[100],
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                const Stack(
                  clipBehavior: Clip.none, // 不裁，裁:Clip.hardEdge , overflow是旧的属性
                  alignment: Alignment.bottomCenter, // 重点属性,没有被Positioned的听alignment的话
                  fit: StackFit.loose, // 默认loose
                  children: [
                    FlutterLogo(size: 120,),
                    Text("text", style: TextStyle(fontSize: 15),),
                    // 精准定位
                    Positioned(left: 10, top: 10, child: FlutterLogo(size: 30)),
                    Positioned(bottom: 0, right: 10, child: Text("22")),
                  ],
                ),
                Container(color: Colors.white, height: 5,),
                Container(
                  color: Colors.yellow[200],
                  height: 100,
                  width: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    /*- StackFit.loose：子组件可以小于Stack的尺寸
                    * - StackFit.expand：非定位子组件强制填充整个Stack
                    * - StackFit.passthrough：Stack的约束直接传递给子组件*/
                    fit: StackFit.loose,
                    children: [
                      Container(color: Colors.red[300], width: 50, height: 50,),
                      Container(color: Colors.white, width: 30, height: 30,)
                    ],
                  ),
            
            
                ),
                Container(color: Colors.white, height: 5,),
                
                /*demo1: 图片上的标签*/
                Container(
                  color: Colors.green[200],
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      // 背景图片
                      Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Warn.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
            
                      // 右上角标签
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('NEW', style: TextStyle(color: Colors.white)),
                        ),
                      ),
            
                      // 底部渐变蒙层
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: 60,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black54],
                            ),
                          ),
                        ),
                      ),
            
                      // 底部文字
                      const Positioned(
                        left: 16,
                        bottom: 16,
                        child: Text(
                          '产品标题',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(color: Colors.white, height: 1,),

                /*demo:浮动按钮*/
                Container(
                  color: Colors.blue[200],
                  width: 200,
                  height: 200,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
                      ),
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),)
                    ],
                  ),
                ),

                /*demo:加载动画遮罩*/
                Stack(
                  children: [
                    // 主要内容
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: ListView(children: [/* 内容 */]),
                    ),
                    // 加载遮罩
                    if (true)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black45,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                  ],
                ),

                /*demo:复杂卡片布局*/
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // 主卡片
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          SizedBox(height: 30), // 为头像留空间
                          Text('用户名', style: TextStyle(fontSize: 18)),
                          Text('用户描述'),
                        ],
                      ),
                    ),

                    // 头像（超出卡片边界）
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('images/done.png'),
                        ),
                      ),
                    ),
                  ],
                )

            
            
            
            
            
              ],
            ),
          ),
        ),
      ),


    );
  }
}
