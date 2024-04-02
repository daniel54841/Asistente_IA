class Busqueda {
  String? producto;
  int? posicion;

  Busqueda({this.producto, this.posicion});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{"producto": producto, "posicion": posicion};
    return map;
  }

  Busqueda.fromMap(Map<String, dynamic> map) {
    producto = map["producto"];
    posicion = map["posicion"];
  }
}
