import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  final StoryBrain brain = StoryBrain();

  Widget build(BuildContext context) {
    Get.put(brain);
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Obx(() {
                      return Text(
                        storyBrain.getStory(),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      );
                    }),
                  ),
                ),
                AnswerButton(
                    backgroundColor: Colors.red,
                    fontColor: Colors.white,
                    onPressed: () => storyBrain.nextStory(1),
                    isOption1: true
                ),
                SizedBox(
                  height: 20.0,
                ),
                AnswerButton(
                    backgroundColor: Colors.blue,
                    fontColor: Colors.white,
                    onPressed: () => storyBrain.nextStory(2),
                    isOption1: false
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class AnswerButton extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final bool isOption1;
  final VoidCallback onPressed;
  final StoryBrain brain = Get.find<StoryBrain>();

  AnswerButton({
    required this.backgroundColor,
    required this.fontColor,
    required this.onPressed,
    required this.isOption1
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Obx(() {
        return Visibility(
          visible: isOption1 || storyBrain.buttonShouldBeVisible(),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: backgroundColor
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: Center(
                  child: Text(
                    storyBrain.getChoice(isOption1),
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

