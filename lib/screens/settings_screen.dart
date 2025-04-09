import 'package:flutter/material.dart';
class Setting extends StatelessWidget {
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
                    bottom: 24,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 71,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Stack(),
                      ),
                      Container(
                        width: 137,
                        height: 12,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 137,
                                height: 12,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF03A4FF),
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
                left: 0,
                top: 112,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                    Container(
                      width: 375,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 66,
                        children: [
                          Container(
                            width: 146,
                            height: 18,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 146,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}