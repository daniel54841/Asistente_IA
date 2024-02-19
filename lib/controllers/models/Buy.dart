///Modelo de la lista de la compra que corresponde a un item
class Buy {
  //si o si
  String? nombre;
  int? cantidad;
  //opcionales
  String? precio;
  String? tienda;

  Buy({required this.nombre, required this.cantidad, this.precio, this.tienda});
}
