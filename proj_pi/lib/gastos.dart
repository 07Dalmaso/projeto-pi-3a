import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_pi/common/extensions/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBalance = true;
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // parte de trás fica embaixo da outra, parte do cartão
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(500, 30),
                  bottomRight: Radius.elliptical(500, 30),
                ),
              ),
              height: 287.h,
            ),
          ),
          Positioned(
              left: 24.0,
              right: 24.0,
              top: 74.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GASTOS',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 155.h,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 32.h,
              ),
              decoration: const BoxDecoration(
                  color: Color(0xFF007504),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo',
                            textScaleFactor: textScaleFactor,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Visibility(
                            visible: showBalance,
                            child: Text(
                              '\$ 1,500.89',
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showBalance = !showBalance;
                          });
                        },
                        child: Text(
                          showBalance ? 'Ocultar saldo' : 'Mostrar saldo',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 36.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: iconSize,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Income',
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '\$ 1,840.00',
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: iconSize,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expenses',
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '\$ 2,824.00',
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 387.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Transaction History',
                      ),
                      Text(
                        'See all',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final color = index % 2 == 0 ? Colors.green : Colors.red;
                      final value =
                          index % 2 == 0 ? "+ \$ 100.00" : "\$ 100.00";
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        leading: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(
                            Icons.monetization_on_outlined,
                          ),
                        ),
                        title: const Text(
                          'Upwork',
                        ),
                        subtitle: const Text(
                          '1969-07-20',
                        ),
                        trailing: Text(
                          value,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
