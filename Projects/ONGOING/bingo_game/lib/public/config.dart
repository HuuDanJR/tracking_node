class ConfigFactory {
  static const int TIME_CALL = 300; //5 min
  static const int LIST_LENGTH = 75; //total length of list generate

  static double ratio_width_parent({required double width}) {
    //width parent
    return width * .7;
  }

  static double ratio_width_child({required double width}) {
    //width child
    return width * .3;
  }

  static double ratio_height_parent({required double height}) {
    //height parent
    return height * .75;
  }

  static double ratio_height_child({required double height}) {
    //height child
    return height * .25;
  }

  static List<double> area_ball_gen(
      {required double width, required double height}) {
    //are of image container in ball generate child
    return [width * .75, height * .55];
  }

  static double borderRadiusCard = 45.0;

  static const String BALL_YELLOW = 'assets/icons/ball_yellow.png';
  static const String BALL_BLUE = 'assets/icons/ball_blue.png';
  static const String BALL_RED = 'assets/icons/ball_red.png';
  static const String BALL_PURPLE = 'assets/icons/ball_purple.png';
  static const String BALL_GREEN = 'assets/icons/ball_green.png';

  static const String tag_red = 'red';
  static const String tag_blue = 'blue';
  static const String tag_green = 'green';
  static const String tag_purple = 'purple';
  static const String tag_yellow = 'yellow';
}
