import 'package:crypto_wallet_fbloc/utils/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  final _pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color(0xffe0e9f8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(45),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Color(0xff347af0),
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(15)),
              ),
            ),
          )
        ],
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageViewController,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Image.asset(
                Items.welcomeData[index]['image'],
                width: ScreenUtil().setWidth(375),
                height: ScreenUtil().setHeight(240),
              ),
              Expanded(
                child: Container(
                  width: ScreenUtil().setWidth(375),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (indicator) => Container(
                              width: 10.0,
                              height: 10.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: indicator == index
                                    ? Color(0xff347af0)
                                    : Color(0xffedf1f9),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          Items.welcomeData[index]['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff0d1f3c),
                            fontSize: ScreenUtil().setSp(36),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          Items.welcomeData[index]['text'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff485068),
                            fontSize: ScreenUtil().setSp(15),
                          ),
                        ),
                        Spacer(),
                        FlatButton(
                          onPressed: () {
                            if (index < 3) {
                              _pageViewController.animateToPage(
                                index + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            } else {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (_) => SignUpPage(),
                              //   ),
                              // );
                            }
                          },
                          child: Container(
                            width: ScreenUtil().setWidth(160),
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              index != 3 ? 'Next step' : 'Let\'s Get Started',
                              style: TextStyle(
                                color: index != 3
                                    ? Color(0xff347af0)
                                    : Colors.white,
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          color: index != 3 ? Colors.white : Color(0xff347af0),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(20.0),
                            side: BorderSide(color: Color(0xff347af0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
