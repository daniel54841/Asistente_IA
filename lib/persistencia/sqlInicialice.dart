import 'package:reproductor_ia/utils/constants/general_constants.dart';
import 'package:sqflite/sqflite.dart';

import '../controllers/models/compra.dart';
import '../controllers/models/tienda.dart';

class SqlInicialice {
  SqlInicialice._privateConstructor();
  static final SqlInicialice instance = SqlInicialice._privateConstructor();

  static Database? _database;

  static String createTableCompras = "CREATE TABLE Compra(nombre TEXT,cantidad INTEGER,precio INTEGER, tienda TEXT,totalGastado INTEGER)";
  // esFavorite == true ? 1 : 0
  static String createTableTienda = "CREATE TABLE Tienda (tiendaNombre TEXT, esFavorite INTEGER)";

  Future<Database> get database async {
    if (_database != null) return _database!;
// lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String databasesPath = "${await getDatabasesPath()}/miBD.db";

    return await openDatabase(databasesPath, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(createTableCompras);
    await db.execute(createTableTienda);
  }

  static Future<void> createDB() async {
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/miBD.db";
    // open the database
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(createTableCompras);
        await db.execute(createTableTienda);
      },
    );
  }

//Operaciones de Compras
  static Future<void> insertCompra(Compra compra) async {
    try {
      Database db = await instance.database;
      int? insertCorrect = await db.insert("Compra", compra.toMap());
      GeneralConstants.logger.i("Numero de inserciones de forma correcta: $insertCorrect");
    } catch (e) {
      GeneralConstants.logger.e("Excepcion al insertar compra: $e");
    }
  }

  static Future<List<Compra>> getTodasLasCompras() async {
    Database db = await instance.database;

    List<Compra> list = [];
    try {
      final queryResults = await db.rawQuery(
        "SELECT * FROM Compra",
      );

      for (Map<String, dynamic> mapa in queryResults) {
        Compra compraToAdd = Compra.fromMap(mapa);
        list.add(compraToAdd);
      }

      GeneralConstants.logger.i("Numero de elementos de la BD en tabla Compra: ${list.length}");
    } catch (e) {
      // Handle any exceptions that might occur during the query
      GeneralConstants.logger.e("Excepcion al obtener todas las compras: $e");
      return [];
    }

    return list;
  }

  //Operaciones de Tienda
  static Future<bool> insertTienda(Tienda tienda) async {
    try {
      Database db = await instance.database;
      int? insertCorrect = await db.insert("Tienda", tienda.toMap());
      GeneralConstants.logger.i("Numero de inserciones de forma correcta: $insertCorrect");
      return true;
    } catch (e) {
      GeneralConstants.logger.e("Excepcion al insertar tienda: $e");
      return false;
    }
  }

  static Future<List<Tienda>> getTodasLasTiendas() async {
    Database db = await instance.database;

    List<Tienda> list = [];
    try {
      final queryResults = await db.rawQuery(
        "SELECT * FROM Tienda",
      );

      for (Map<String, dynamic> mapa in queryResults) {
        Tienda tiendaToAdd = Tienda.fromMap(mapa);
        list.add(tiendaToAdd);
      }

      GeneralConstants.logger.i("Numero de elementos de la BD en tabla Tienda: ${list.length}");
    } catch (e) {
      // Handle any exceptions that might occur during the query
      GeneralConstants.logger.e("Excepcion al obtener todas las tiendas: $e");
      return [];
    }

    return list;
  }
}
