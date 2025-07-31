import 'package:flutter/material.dart';
import 'package:flutter_mapsearch_app/ui/second/review_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // 위젯에서 화면이 없어질 때 호출 / 호출해주지 않으면 메모리에서 소거되지 않음
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    print('onSearch 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onSubmitted: onSearch, // 키보드에서 완료 버튼 누를 때 검색될 수 있게 구현
            controller: textEditingController,
            maxLines: 1,
            decoration: InputDecoration(
                hintText: '검색어를 입력해 주세요.', // 입력전에 보이게 설정 입력하면 사라짐
                border: MaterialStateOutlineInputBorder.resolveWith((states) {
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.black)); // 포커스 되면 선 검정색으로 표시
                  }
                  return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey) // 아니면 회색
                      );
                })),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ReviewPage();
                  }));
                },
                child: Container(
                  width: 50,
                  height: 105,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('title',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                        SizedBox(height: 5),
                        Text(
                          'category',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'roadAddress',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
