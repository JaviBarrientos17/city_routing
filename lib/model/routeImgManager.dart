// ignore_for_file: file_names

class RouteImageManager {
  static String getImageUrl(String routeShortName) {
    switch (routeShortName) {
      case "L6":
        return "URL_de_imagen_L6";
      case "L7":
        return "URL_de_imagen_L7";
      case "S2":
        return "URL_de_imagen_S2";
      case "S1":
        return "URL_de_imagen_S1";
      case "R6":
        return "URL_de_imagen_R6";
      case "R5":
        return "https://www.fgc.cat/wp-content/uploads/2020/06/icons-45-px-lines-fgc-r-5.png";
      case "S4":
        return "URL_de_imagen_S4";
      case "L8":
        return "URL_de_imagen_L8";
      case "FV":
        return "URL_de_imagen_FV";
      case "S8":
        return "URL_de_imagen_S8";
      case "S3":
        return "URL_de_imagen_S3";
      case "L12":
        return "URL_de_imagen_L12";
      case "MM":
        return "URL_de_imagen_MM";
      case "RL1":
        return "URL_de_imagen_RL1";
      case "L1":
        return "URL_de_imagen_L1";
      case "RL2":
        return "URL_de_imagen_RL2";
      case "R63":
        return "URL_de_imagen_R63";
      case "R53":
        return "URL_de_imagen_R53";
      default:
        return "URL_de_imagen_predeterminada";
    }
  }
}
