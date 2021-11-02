import 'package:get/get.dart';

import 'constants.dart';

class StoryBrain extends GetxController {
  RxInt _storyNumber = 0.obs;

  String getStory() {
    return storyData[_storyNumber.value].storyTitle;
  }

  String getChoice(bool _isOption1) {
    if (_isOption1)
      return storyData[_storyNumber.value].choice1;
    else
      return storyData[_storyNumber.value].choice2;
  }

  void nextStory(int userChoice) {
    switch (_storyNumber.value) {
      case 0:
        if (userChoice == 1) {
          _storyNumber.value = 2;
        } else {
          _storyNumber.value = 1;
        }
        break;

      case 1:
        if (userChoice == 1) {
          _storyNumber.value = 2;
        } else {
          _storyNumber.value = 3;
        }
        break;

      case 2:
        if (userChoice == 1) {
          _storyNumber.value = 5;
        } else {
          _storyNumber.value = 4;
        }
        break;

      case 3:
      case 4:
      case 5:
        restart();
    }
  }

  void restart() {
    _storyNumber.value = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber.value < 3;
  }
}
