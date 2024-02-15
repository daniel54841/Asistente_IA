class AssetsRoute {
  static String animationPath(String nameAnimation) {
    return "assets/animations/$nameAnimation.json";
  }

  static String animationEmptyPath(String nameAnimation) {
    return "assets/animations/empty_list/$nameAnimation.json";
  }
}
