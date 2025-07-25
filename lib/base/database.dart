// lib/base/database_helper.dart
import 'dart:ffi';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE CUENTAS(
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NUMERO INTEGER,
            CLAVE VARCHAR(50),
            NOMBRE VARCHAR(50),
            SALDO NUMERIC(12,2)
          )
        ''');
        await db.execute('''
          CREATE TABLE TRANSFERENCIAS(
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            ID_CUENTA INTEGER REFERENCES CUENTAS(ID),
            ID_CUENTA_DESTINO INTEGER REFERENCES CUENTAS(ID),
            FECHA DATE,
            MONTO NUMERIC(12,2),
            CONCEPTO VARCHAR(100)
          )
        ''');
        await db.execute('''
          CREATE TABLE PAGOS_TIPOS(
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            DESCRIPCION VARCHAR(100)
          )
        ''');
        await db.execute('''
          CREATE TABLE PAGOS(
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            ID_CUENTA INTEGER REFERENCES CUENTAS(ID),
            ID_TIPO INTEGER REFERENCES PAGOS_TIPOS(ID),
            FECHA DATE,
            MONTO NUMERIC(12,2)
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getAllCuentas() async {
    final db = await database;
    return await db.query('CUENTAS');
  }

  Future<void> insertCuenta(
    String nombre,
    int numero,
    String clave,
    double saldo,
  ) async {
    final db = await database;
    await db.insert('CUENTAS', {
      'NOMBRE': nombre,
      'NUMERO': numero,
      'CLAVE': clave,
      'SALDO': saldo,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int?> getCuentaIdPorNumero(int numeroCuenta) async {
    final db = await database;
    final result = await db.query(
      'CUENTAS',
      where: 'NUMERO = ?',
      whereArgs: [numeroCuenta],
    );

    if (result.isNotEmpty) {
      return result.first['ID'] as int;
    } else {
      return null;
    }
  }

  Future<void> updateCuentaClave(int id, String clave) async {
    final db = await database;
    await db.update(
      'CUENTAS',
      {'CLAVE': clave},
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
