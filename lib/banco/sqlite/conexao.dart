import 'package:path/path.dart';
import 'package:pet_house/banco/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _conexao;

  static Future<Database> getConexao() async {
    if (_conexao == null) {
      String path = join(await getDatabasesPath(), 'banco.db');

      _conexao = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          for (var comando in criar_banco) {
            db.execute(comando);
          }
        },
      );
    }
    return _conexao!;
  }
}
