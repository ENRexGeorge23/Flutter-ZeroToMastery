import 'package:basics/application/theme_service.dart';
import 'package:basics/presentation/theme_animation/widgets/sun.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeAnimationScreen extends StatelessWidget {
  const ThemeAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme Animation'),
      ),
      body: Consumer<ThemeService>(builder: ((context, themeService, child) {
        return Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      themeService.isDarkModeOn ? Colors.black38 : Colors.grey,
                  offset: const Offset(0, 3),
                  blurRadius: 5,
                  spreadRadius: 7,
                )
              ],
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: themeService.isDarkModeOn
                    ? const [
                        Color(0xFF94A9FF),
                        Color(0xFF6B66CC),
                        Color(0xFF200F75),
                      ]
                    : const [
                        Color(0xDDFFFA66),
                        Color(0xDDFFA057),
                        Color(0xDD940B99)
                      ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(child: const Sun()),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 225,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: themeService.isDarkModeOn
                          ? Colors.grey[850]
                          : Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            themeService.isDarkModeOn
                                ? 'Too dark?'
                                : 'Too bright?',
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            themeService.isDarkModeOn
                                ? 'Let the sun rise '
                                : 'Let it be night',
                            style: const TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Switch(
                              value: themeService.isDarkModeOn,
                              onChanged: (value) {
                                themeService.toggleTheme();
                              })
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
      })),
    );
  }
}
