import 'package:flutter/material.dart';
class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: const Color(0xFF0092EC),
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            shadows: [
              BoxShadow(
                color: Color(0xFF0093ED),
                blurRadius: 0,
                offset: Offset(0, 8),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  padding: const EdgeInsets.only(
                    top: 60,
                    left: 24,
                    right: 24,
                    bottom: 24,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Container(
                        width: 120,
                        height: 18,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 120,
                                height: 18,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF0092EC),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 242,
                        height: 18,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 242,
                                height: 18,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF7DD8FF),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 496,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD6F5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Container(
                        width: 279,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Container(
                                  width: 190,
                                  height: 12,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 190,
                                          height: 12,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF0092EC),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 122,
                                  height: 12,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 122,
                                          height: 12,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF7DD8FF),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 628,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD6F5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Container(
                        width: 279,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Container(
                                  width: 190,
                                  height: 12,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 190,
                                          height: 12,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF0092EC),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 122,
                                  height: 12,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 122,
                                          height: 12,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF7DD8FF),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 155,
                child: Container(
                  width: 375,
                  height: 325,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 313,
                        top: 72,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 313,
                        top: 120,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 313,
                        top: 216,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 313,
                        top: 168,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 313,
                        top: 264,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD6F5FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFFD6F5FF),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 265,
                        top: 72,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 265,
                        top: 120,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 265,
                        top: 216,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 265,
                        top: 168,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 265,
                        top: 264,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD6F5FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFFD6F5FF),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 217,
                        top: 72,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 217,
                        top: 120,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 217,
                        top: 216,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 217,
                        top: 168,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 217,
                        top: 264,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD6F5FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFFD6F5FF),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 169,
                        top: 72,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 169,
                        top: 120,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 169,
                        top: 216,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 169,
                        top: 168,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0092EC),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 169,
                        top: 264,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 72,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD6F5FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFFD6F5FF),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 120,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 216,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 168,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 264,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 73,
                        top: 72,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD6F5FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFFD6F5FF),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 73,
                        top: 120,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 73,
                        top: 216,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 73,
                        top: 168,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 73,
                        top: 264,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 72,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD6F5FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFFD6F5FF),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 120,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 216,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 168,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 264,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7DD8FF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                color: const Color(0xFF0092EC),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 24,
                        child: Container(
                          width: 325,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 24,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                              Container(
                                width: 120,
                                height: 18,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 120,
                                        height: 18,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFD6F5FF),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Stack(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 292,
                top: 50,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD6F5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Stack(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 279,
                top: 716,
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0092EC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Stack(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}