import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thankyoumessage/utils/dimensions.dart';
import 'package:thankyoumessage/widgets/small_text.dart';
import 'package:thankyoumessage/widgets/words.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

import '../../widgets/big_text.dart';

class TextBodyPage extends StatefulWidget {
  const TextBodyPage({Key? key}) : super(key: key);

  @override
  State<TextBodyPage> createState() => _TextBodyPageState();
}

class _TextBodyPageState extends State<TextBodyPage> {

  String? _btn1SelectedVal;
  String? _result;
  late List<List<String>> _lists;
  late List<String> _currentList;
  late String _randomLine;
  late String _currentListName;
  final random = Random();

  @override
  void initState(){
    _lists = [WordsOneLine, WordsLongLine, WordsToComp, WordsToFam, WordsToFriends];
    _currentList = _lists[0];
    _currentListName = "짧은 글";
    _randomLine = _currentList[0];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
                height: Dimensions.height10 * 6,
                width: Dimensions.width10 * 26,
                child: BigText(
                  text: '보내고싶은 사람을 정해주세요',
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: Dimensions.width10*8),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius10 * 2),
                      color: Colors.blue.shade100,
                      border: Border.all(width: 3, color: Colors.black)),
                  height: Dimensions.height10 * 6,
                  width: Dimensions.width10 * 16,
                  child: ListTile(
                    title: DropdownButton(
                      value: _currentListName,
                      items: const [
                        DropdownMenuItem(
                          value: "짧은 글",
                          child: Text("짧은 글"),),
                        DropdownMenuItem(
                          value: "정성 가득 글",
                          child: Text("정성 가득 글"),),
                        DropdownMenuItem(
                          value: "직장동료 / 상사",
                          child: Text("직장동료 / 상사"),),
                        DropdownMenuItem(
                          value: "가족",
                          child: Text("가족"),),
                        DropdownMenuItem(
                          value: "친구",
                          child: Text("친구"),),
                      ],
                      onChanged: (value){
                        setState(() {
                          _currentListName = value!;
                          switch(_currentListName) {
                            case "짧은 글" :
                              _currentList = _lists[0];
                              break;
                            case "정성 가득 글" :
                              _currentList = _lists[1];
                              break;
                            case "직장동료 / 상사" :
                              _currentList = _lists[2];
                              break;
                            case "가족" :
                              _currentList = _lists[3];
                              break;
                            case "친구" :
                              _currentList = _lists[4];
                              break;

                          }
                        });
                      },
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(right: Dimensions.width10*9),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(Dimensions.radius10 * 2),
                    color: Colors.blue.shade200,
                    border: Border.all(width: 3, color: Colors.black)),
                height: Dimensions.height10 * 7,
                width: Dimensions.width10 * 7,
                child: IconButton(onPressed: () {
                  setState(() {
                    _randomLine = _currentList[Random().nextInt(_currentList.length)];
                  });
                },
                  icon: Icon(Icons.refresh),
                ),
              )
            ],
          ),
          SizedBox(height: Dimensions.height10*4),
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            height: Dimensions.height10 * 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius10 * 2),
              border: Border.all(width: 1.0, color: Colors.black),
            ),
            child: Center(
              child: BigText(
                text: "${_randomLine}",
                size: 20,
              ),
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(Icons.copy),
              onPressed: (){
                Clipboard.setData(ClipboardData(text: "${_randomLine}"));
              },
            ),
          )

        ],
      ),
    );
  }
}
