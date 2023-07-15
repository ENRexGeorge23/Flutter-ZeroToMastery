import 'package:basics/presentation/components/custom_button.dart';
import 'package:basics/presentation/widget_examples/widgets/buttons_example.dart';
import 'package:basics/presentation/widget_examples/widgets/first_column_child.dart';
import 'package:basics/presentation/widget_examples/widgets/hello_world_widget.dart';
import 'package:basics/presentation/widget_examples/widgets/jordan_peterson_pic.dart';
import 'package:basics/presentation/widget_examples/widgets/layout_builder_exampler.dart';
import 'package:basics/presentation/widget_examples/widgets/media_query.dart';
import 'package:basics/presentation/widget_examples/widgets/row_expanded_widget.dart';
import 'package:basics/presentation/widget_examples/widgets/steve_jobs_picture.dart';
import 'package:flutter/material.dart';

class WidgetExamples extends StatelessWidget {
  const WidgetExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics'),
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RowExpandedWidget(),
                SizedBox(
                  height: 20,
                ),
                FirstColumnChild(),
                SizedBox(
                  height: 20,
                  width: 22,
                ),
                HelloWorldWidget(),
                SizedBox(
                  height: 20,
                ),
                SteveJobsPicture(),
                SizedBox(
                  height: 20,
                ),
                JordanPetersonPic(),
                SizedBox(
                  height: 20,
                ),
                MediaQueryWidget(),
                SizedBox(
                  height: 40,
                ),
                LayOutBuilderExampler(),
                SizedBox(
                  height: 40,
                ),
                ButtonExample(),
                SizedBox(
                  height: 40,
                ),
                CustomButton()
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('Floating Action Button Pressed'),
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}
