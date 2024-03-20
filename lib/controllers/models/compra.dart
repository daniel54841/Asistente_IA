///Modelo de la lista de la compra que corresponde a un item
class Compra {
  //si o si
  String? nombre;
  int? cantidad;
  //opcionales
  String? precio;
  String? tienda;
  int? totalGastado;

  Compra({
    required this.nombre,
    this.cantidad,
    this.precio,
    this.tienda,
  });

  Compra.fromMap(Map<String, dynamic> map) {
    nombre = map[nombre];
    cantidad = map[cantidad];
    precio = map[precio];
    tienda = map[tienda];
    totalGastado = map[totalGastado];
  }
}
