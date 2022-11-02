import 'package:pet_house/banco/entidades/servico.dart';
import 'package:pet_house/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class ServicoDAO {
  Future<bool> salvar(Servico servico) async {
    Database db = await Conexao.getConexao();
    const sql = 'INSERT INTO servico (nome, descricao) VALUES (?,?)';
    int linhasAfetadas =
        await db.rawInsert(sql, [servico.nome, servico.descricao]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluir(int id) async {
    Database db = await Conexao.getConexao();
    const sql = 'DELETE FROM servico WHERE id =?';
    int linhasAfetadas = await db.rawDelete(sql, [id]);
    return linhasAfetadas > 0;
  }
}
