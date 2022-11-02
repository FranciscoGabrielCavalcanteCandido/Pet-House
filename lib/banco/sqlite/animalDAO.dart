import 'package:pet_house/banco/entidades/animal.dart';
import 'package:pet_house/banco/entidades/dono.dart';
import 'package:pet_house/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';
import 'script.dart';

class AnimalDAO {
  Future<bool> salvar(Animal animal) async {
    Database db = await Conexao.getConexao();
    const sql = 'INSERT INTO animal (nome, raca) VALUES (?,?)';
    int linhasAfetadas = await db.rawInsert(sql, [animal.nome, animal.raca]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluir(int id) async {
    Database db = await Conexao.getConexao();
    const sql = 'DELETE FROM animal WHERE id =?';
    int linhasAfetadas = await db.rawDelete(sql, [id]);
    return linhasAfetadas > 0;
  }

  Future<Animal> consultar(int id) async {
    late Database db;
    try {
      const sql = 'SELECT * FROM animal WHERE id = ?';
      db = await Conexao.getConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) {
        throw Exception('Nenhum registro de id $id encontrado!');
      }
      Animal animal = Animal(
        id: resultado['id'] as int,
        nome: resultado['nome'].toString(),
        raca: resultado['raca'].toString(),
      );
      return animal;
    } catch (e) {
      throw Exception('Não foi possível retornar a consulta do registro $id');
    }
  }

  Future<List<Animal>> listar() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM animal';
      db = await Conexao.getConexao();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List<Animal> animais = resultado.map((linha) {
        return Animal(
          id: linha['id'] as int,
          nome: linha['nome'].toString(),
          raca: linha['raca'].toString(),
        );
      }).toList();
      return animais;
    } catch (e) {
      throw Exception('classe AnimalDAOSQLite, método listar');
    }
  }
}
