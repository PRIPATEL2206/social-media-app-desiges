import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/app_text.dart';
import 'package:social_media/components/like_box_container.dart';
import 'package:social_media/pages/detail_page.dart';

class PhotoSlider extends StatefulWidget {
  const PhotoSlider({super.key});

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  late List<String> _imagePath;
  late int _numberOfImage;
  late int _curentImageIndex;
  late int _isLike;
  late bool _isShowDetailPage;

  @override
  void initState() {
    super.initState();
    _imagePath = [
      "assets/images/like.jpg",
      "assets/images/first.jpg",
      "assets/images/second.jpg",
      "assets/images/like2.jpg",
      "assets/images/first2.jpg",
    ];
    _numberOfImage = _imagePath.length;
    _curentImageIndex = 0;
    _isLike = 1;
    _isShowDetailPage = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onHorizontalDragEnd: (details) {
            final velocity = details.velocity.pixelsPerSecond;

            // print(velocity.dx.abs());
            // print(velocity.dx.abs() > velocity.dy.abs());
            if (velocity.dx.abs() > velocity.dy.abs()) {
              if (velocity.dx > 0) {
                // print("left->right");
                // print("notInterestd");
                showNopeBox();
              } else {
                // print("right->left");
                // print("like");
                showLikeBox();
              }
              return;
            }

            // print(velocity.dy);
            if (velocity.dy < 0) {
              // show detail page
              showDetailPage(true);
            } else {
              // not show detail page
              showDetailPage(false);
            }
          },
          onDoubleTap: () {
            // showDetailPage(!_isShowDetailPage);
          },
          onTapUp: (details) {
            // print(details.localPosition.toString());
            double positionInX = details.localPosition.dx;
            _isLike = 1;
            if (width / 2 < positionInX) {
              showRightImage();
            } else {
              showLeftImage();
            }
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(25, 25))),
            width: double.maxFinite,
            child: _isShowDetailPage
                ? DetailPage(
                    imagePath: _imagePath[_curentImageIndex],
                  )
                : Stack(children: [
                    Image(
                        height: 380,
                        fit: BoxFit.fill,
                        image: AssetImage(_imagePath[_curentImageIndex])),
                    Positioned(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: _imagePath.map((e) {
                                bool isSelected =
                                    e == _imagePath[_curentImageIndex];

                                return Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.grey
                                            : const Color.fromARGB(
                                                178, 214, 202, 202),
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                                left: Radius.elliptical(10, 10),
                                                right:
                                                    Radius.elliptical(10, 10))),
                                  ),
                                );
                              }).toList()),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _curentImageIndex == 0
                                  ? Container()
                                  : const Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Color.fromARGB(255, 151, 131, 131),
                                    ),
                              _curentImageIndex + 1 == _numberOfImage
                                  ? Container()
                                  : const Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: Color.fromARGB(255, 151, 131, 131),
                                    ),
                            ],
                          )
                        ],
                      ),
                    )),
                    Positioned(
                        bottom: 0,
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _isLike == 1
                                ? Container()
                                : _isLike == 0
                                    ? const LikeBoxContainer(
                                        text: "Nope",
                                        color: Colors.red,
                                      )
                                    : const LikeBoxContainer(
                                        text: "Like",
                                        color: Colors.green,
                                      ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 8),
                              color: const Color.fromARGB(43, 0, 0, 0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        AppText(
                                          text: "Samara Doe, 26 ",
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          CupertinoIcons.checkmark_seal_fill,
                                          size: 30,
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                    const AppText(
                                      text: "Live in Spain",
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                            ),
                                            AppText(
                                              text: "23.1",
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: const [
                                              Positioned(
                                                  top: 5,
                                                  child: Icon(Icons
                                                      .keyboard_double_arrow_up_sharp)),
                                              Icon(Icons.keyboard_arrow_up),
                                            ],
                                          ),
                                        ),
                                        const Icon(Icons.more_vert_rounded),
                                      ],
                                    )
                                  ]),
                            ),
                          ],
                        ))
                  ]),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: _isLike == 0
                        ? const Color.fromARGB(255, 241, 169, 163)
                        : const Color.fromARGB(255, 252, 245, 245),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(20, 20)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 0.3),
                        blurRadius: 0.6,
                      )
                    ]),
                child: const Icon(
                  CupertinoIcons.clear_thick,
                  size: 34,
                  color: Colors.red,
                )),
            Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 0.3),
                        blurRadius: 0.6,
                      )
                    ]),
                child: const Icon(
                  Icons.star_rounded,
                  size: 34,
                  color: Color.fromARGB(255, 252, 230, 32),
                )),
            Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: _isLike == 2
                        ? const Color.fromARGB(255, 147, 241, 150)
                        : const Color.fromARGB(255, 240, 245, 241),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(20, 20)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 0.3),
                        blurRadius: 0.6,
                      )
                    ]),
                child: const Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 34,
                  color: Colors.green,
                )),
          ],
        )
      ],
    );
  }

  void showRightImage() {
    if (_curentImageIndex + 1 < _numberOfImage) {
      setState(() {
        _curentImageIndex++;
      });
    }
  }

  void showLeftImage() {
    if (_curentImageIndex > 0) {
      setState(() {
        _curentImageIndex--;
      });
    }
  }

  void showLikeBox() {
    setState(() {
      _isLike = 2;
    });
  }

  void showNopeBox() {
    setState(() {
      _isLike = 0;
    });
  }

  void showDetailPage(bool isShow) {
    setState(() {
      _isShowDetailPage = isShow;
    });
  }
}
