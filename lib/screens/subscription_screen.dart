import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
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
                left: 81,
                top: -7,
                child: Container(
                  width: 375,
                  padding: const EdgeInsets.only(
                    top: 48,
                    left: 24,
                    right: 24,
                    bottom: 24,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 71,
                    children: [
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
                                  color: const Color(0xFF0092EC),
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
                left: 300,
                top: 692,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                  width: 425,
                  height: 260,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0092EC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 108,
                        top: 323,
                        child: Opacity(
                          opacity: 0.60,
                          child: Container(
                            width: 44,
                            height: 66,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF0071B1),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 214,
                        top: 207,
                        child: Container(
                          width: 12,
                          height: 182,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 12,
                                  height: 182,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFD6F5FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 194,
                        top: 303,
                        child: Container(
                          width: 8,
                          height: 86,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 8,
                                  height: 86,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF7DD8FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 231,
                        child: Container(
                          width: 18,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 18,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF7DD8FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 166,
                        child: Container(
                          width: 18,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 18,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF7DD8FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 101,
                        child: Container(
                          width: 18,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 18,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF7DD8FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 36,
                        child: Container(
                          width: 18,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 18,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF7DD8FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                  ),
                                ),
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
                left: 24,
                top: 692,
                child: Container(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                  width: 425,
                  height: 260,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF7DD8FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 108,
                        top: 323,
                        child: Opacity(
                          opacity: 0.60,
                          child: Container(
                            width: 44,
                            height: 66,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF0071B1),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 214,
                        top: 207,
                        child: Container(
                          width: 12,
                          height: 182,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 12,
                                  height: 182,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFD6F5FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 194,
                        top: 303,
                        child: Container(
                          width: 8,
                          height: 86,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 8,
                                  height: 86,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFD6F5FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 231,
                        child: Container(
                          width: 18,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 18,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFD6F5FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 166,
                        child: Container(
                          width: 18,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 18,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFD6F5FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 101,
                        child: Container(
                          width: 18,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 18,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFD6F5FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 36,
                        child: Container(
                          width: 18,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 18,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFD6F5FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                                  ),
                                ),
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
                left: 24,
                top: 120,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 24),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD6F5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(
                        'Monto a Pagar',
                        style: TextStyle(
                          color: const Color(0xFF0092EC),
                          fontSize: 21,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1.14,
                        ),
                      ),
                      Text(
                        '\$100,00',
                        style: TextStyle(
                          color: const Color(0xFF0092EC),
                          fontSize: 40,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1.20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 291,
                top: 715,
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