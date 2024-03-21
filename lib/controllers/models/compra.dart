///Modelo de la lista de la compra que corresponde a un item
class Compra {
  //si o si
  String? nombre;
  int? cantidad;
  //opcionales
  int? precio;
  int? totalGastado;
  String? tienda;

  Compra({
    required this.nombre,
    this.cantidad,
    this.precio,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      "nombre": nombre,
      "cantidad": cantidad,
      "precio": precio,
      "totalGastado": totalGastado,
      "tienda": tienda
    };
    return map;
  }

  Compra.fromMap(Map<String, dynamic> map) {
    nombre = map["nombre"];
    cantidad = map["cantidad"];
    precio = map["precio"];
    tienda = map["tienda"];
    totalGastado = map["totalGastado"];
  }
}
