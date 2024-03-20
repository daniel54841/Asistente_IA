class Tienda {
  String? tiendaNombre;
  bool? esFavorite;

  Tienda(this.tiendaNombre, this.esFavorite);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      "tiendaNombre": tiendaNombre,
      "esFavorite": esFavorite == true ? 1 : 0,
    };
    return map;
  }

  Tienda.fromMap(Map<String, dynamic> map) {
    tiendaNombre = map[tiendaNombre];
    esFavorite = map[esFavorite] == 1;
  }
}
