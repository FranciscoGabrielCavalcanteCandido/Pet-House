import 'package:pet_house/banco/entidades/dono.dart';
import 'package:pet_house/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class DonoDAO {
  Future<bool> salvar(Dono dono) async {
    Database db = await Conexao.getConexao();
    const sql = 'INSERT INTO dono (nome, cpf, cidade, bairro) VALUES (?,?,?,?)';
    int linhasAfetadas = await db
        .rawInsert(sql, [dono.nome, dono.cpf, dono.cidade, dono.bairro]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluir(int id) async {
    Database db = await Conexao.getConexao();

    const sql = 'DELETE FROM dono WHERE id =?';
    int linhasAfetadas = await db.rawDelete(sql, [id]);
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
          cpf: resultado['cpf'].toString(),
          cidade: resultado['cidade'].toString(),
          bairro: resultado['bairro'].toString());
      return dono;
    } catch (e) {
      throw Exception('Não foi possível retornar a consulta do registro $id');
    }
  }

  Future<List<Dono>> listar() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM dono';
      db = await Conexao.getConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Dono> donos = resultado.map((linha) {
        return Dono(
          id: linha['id'] as int,
          nome: linha['nome'].toString(),
          cpf: linha['cpf'].toString(),
          cidade: linha['cidade'].toString(),
          bairro: linha['bairro'].toString(),
        );
      }).toList();
      return donos;
    } catch (e) {
      throw Exception('erro no método listar dono');
    }
  }
}
