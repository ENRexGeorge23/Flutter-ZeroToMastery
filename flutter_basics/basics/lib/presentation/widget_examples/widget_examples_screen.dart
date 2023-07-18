import 'package:basics/application/theme_service.dart';
import 'package:basics/presentation/components/custom_button.dart';
import 'package:basics/presentation/widget_examples/widgets/buttons_example.dart';
import 'package:basics/presentation/widget_examples/widgets/first_column_child.dart';
import 'package:basics/presentation/widget_examples/widgets/hello_world_widget.dart';
// import 'package:basics/presentation/widget_examples/widgets/jordan_peterson_pic.dart';
import 'package:basics/presentation/widget_examples/widgets/layout_builder_exampler.dart';
import 'package:basics/presentation/widget_examples/widgets/media_query.dart';
import 'package:basics/presentation/widget_examples/widgets/person.dart';
import 'package:basics/presentation/widget_examples/widgets/row_expanded_widget.dart';
// import 'package:basics/presentation/widget_examples/widgets/steve_jobs_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetExamples extends StatelessWidget {
  const WidgetExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const RowExpandedWidget(),
            const SizedBox(
              height: 20,
            ),
            const FirstColumnChild(),
            const SizedBox(
              height: 20,
              width: 22,
            ),
            const HelloWorldWidget(),
            const SizedBox(
              height: 20,
            ),
            // const SteveJobsPicture(),
            const Person(
                pictureUrl:
                    'https://cdn.profoto.com/cdn/053149e/contentassets/d39349344d004f9b8963df1551f24bf4/profoto-albert-watson-steve-jobs-pinned-image-original.jpg?width=1280&quality=75&format=jpg',
                name: 'Steve Jobs',
                age: '52',
                country: 'USA',
                job: 'CEO'),
            const SizedBox(
              height: 20,
            ),
            const Person(
                pictureUrl:
                    'https://yt3.googleusercontent.com/Ko0UXEQL6PLt4CE_nQkI8aL6llY_GtWu-rQoZ3tgh1Gsmy7qKOrvazU4nBQOZ3kl0TZ3bivz4wM=s900-c-k-c0x00ffffff-no-rj',
                name: 'Jordan Peterson',
                age: '67',
                country: 'Canada',
                job: 'Philosopher'),
            // const JordanPetersonPic(),
            const SizedBox(
              height: 20,
            ),
            const MediaQueryWidget(),
            const SizedBox(
              height: 40,
            ),
            const LayOutBuilderExampler(),
            const SizedBox(
              height: 40,
            ),
            const ButtonExample(),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onTap: () {
                debugPrint('tapped');
              },
              icon: Icons.home,
              iconColor: Colors.white,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButtonGesture(
                onTap: () {
                  debugPrint('Custom Button Gesture Tapped');
                },
                text: 'text')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeService>(context, listen: false).toggleTheme();
        },
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}
