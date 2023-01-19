import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thankyoumessage/pages/home/text_body_page.dart';
import 'package:thankyoumessage/utils/dimensions.dart';
import 'package:thankyoumessage/widgets/big_text.dart';
import 'package:thankyoumessage/widgets/small_text.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height5*20, bottom: Dimensions.height5*15),
              padding: EdgeInsets.only(left: Dimensions.width10*2, right: Dimensions.width10*2),
              decoration: BoxDecoration(
                  color: Colors.pink[200],
              border: Border(
                top: BorderSide(width: 14, color: Colors.yellow.shade200),
                bottom: BorderSide(width: 14, color: Colors.yellow.shade200)
              )
              ),
              child:
                  Container(

                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Center(

                      child: BigText(text: '설날 인사말 생성기 <3', size: 30, color: Colors.white,)
                      ),
                  ),
                  )
              ),
          Expanded(child: TextBodyPage(),
          )
        ],
      ),
    );
  }
}
