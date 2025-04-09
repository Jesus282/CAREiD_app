import 'package:flutter/material.dart';
class Alarm extends StatelessWidget {
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
                    top: 48,
                    left: 24,
                    right: 24,
                    bottom: 32,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 80,
                    children: [
                      Container(
                        width: 36,
                        height: 12,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 36,
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
                      Container(
                        width: 101,
                        height: 12,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 101,
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
                        width: 36,
                        height: 12,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 36,
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
                ),
              ),
              Positioned(
                left: 24,
                top: 118,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.all(24),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD6F5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Container(
                        width: 213,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Text(
                              '6:02',
                              style: TextStyle(
                                color: const Color(0xFF0092EC),
                                fontSize: 54,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 1.19,
                              ),
                            ),
                            Container(
                              width: 159,
                              height: 18,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 159,
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
                      Container(
                        width: 60,
                        height: 36,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 60,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF7DD8FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 4,
                              top: 4,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD6F5FF),
                                  shape: OvalBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: const Color(0xFF0071B1),
                                    ),
                                  ),
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
                top: 456,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.all(24),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD6F5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Container(
                        width: 213,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Text(
                              '6:02',
                              style: TextStyle(
                                color: const Color(0xFF0092EC),
                                fontSize: 54,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 1.19,
                              ),
                            ),
                            Container(
                              width: 159,
                              height: 18,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 159,
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
                      Container(
                        width: 60,
                        height: 36,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 60,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF7DD8FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 4,
                              top: 4,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD6F5FF),
                                  shape: OvalBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: const Color(0xFF0071B1),
                                    ),
                                  ),
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
                top: 625,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.all(24),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD6F5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Container(
                        width: 213,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Text(
                              '21:72',
                              style: TextStyle(
                                color: const Color(0xFF0092EC),
                                fontSize: 54,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 1.19,
                              ),
                            ),
                            Container(
                              width: 159,
                              height: 18,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 159,
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
                      Container(
                        width: 60,
                        height: 36,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 60,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF7DD8FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 4,
                              top: 4,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD6F5FF),
                                  shape: OvalBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: const Color(0xFF0071B1),
                                    ),
                                  ),
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
                top: 287,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.all(24),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0092EC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Container(
                        width: 213,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Text(
                              '12:99',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 54,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 1.19,
                              ),
                            ),
                            Container(
                              width: 159,
                              height: 18,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 159,
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
                      Container(
                        width: 60,
                        height: 36,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 60,
                                height: 36,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD6F5FF),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: const Color(0xFF0092EC),
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 28,
                              top: 4,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF0092EC),
                                  shape: OvalBorder(),
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
            ],
          ),
        ),
      ],
    );
  }
}