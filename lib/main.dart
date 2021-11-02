import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //Choice 1 made by user.
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      child: Center(
                        child: Text(
                          storyBrain.getChoice1(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //Choice 2 made by user.
                          setState(() {
                            storyBrain.nextStory(2);
                          });
                        },
                        child: Center(
                          child: Text(
                            storyBrain.getChoice2(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
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
    );
  }
}

class AnswerButton extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final VoidCallback onPressed;

  const AnswerButton({
    required this.backgroundColor,
    required this.fontColor,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Visibility(
        visible: storyBrain.buttonShouldBeVisible(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Center(
                child: Text(
                  storyBrain.getChoice2(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

