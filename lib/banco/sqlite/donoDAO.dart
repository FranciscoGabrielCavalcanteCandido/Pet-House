
import 'package:pet_house/banco/entidades/dono.dart';
import 'package:pet_house/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class DonoDAO {
  late Database _db;
  late String _sql;

  Future<bool> salvar(Dono dono) async {
    _db = await Conexao.getConexao();
    _sql =
        'INSERT INTO dono (nome, telefone, cpf, cidade, bairro) VALUES (?,?,?,?,?)';
    int linhasAfetadas = await _db.rawInsert(
        _sql, [dono.nome, dono.telefone, dono.cpf, dono.cidade, dono.bairro]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluir(int id) async {
    _db = await Conexao.getConexao();
    _sql = 'DELETE FROM dono WHERE id =?';
    int linhasAfetadas = await _db.rawDelete(_sql, [id]);
    return linhasAfetadas > 0;
  }

  Future<Dono> consultar(int id) async {
    late Database db;
    try {
      const sql = 'SELECT * FROM animal WHERE id = ?';
      db = await Conexao.getConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) {
        throw Exception('Nenhum registro de id $id encontrado!');
      }
      Dono dono = Dono(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          telefone: resultado['telefone'] as int,
          cpf: resultado['cpf'].toString(),
          cidade: resultado['cidade'].toString(),
          bairro: resultado['bairro'].toString());
      return dono;
    } catch (e) {
      throw Exception('Não foi possível retornar a consulta do registro $id');
    } finally {
      db.close();
    }
  }
}
