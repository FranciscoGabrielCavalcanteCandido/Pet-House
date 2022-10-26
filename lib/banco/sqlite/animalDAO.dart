
import 'package:pet_house/banco/entidades/animal.dart';
import 'package:pet_house/banco/entidades/dono.dart';
import 'package:pet_house/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class AnimalDAO {
  late Database _db;
  late String _sql;

  Future<bool> salvar(Animal animal) async {
    _db = await Conexao.getConexao();
    _sql = 'INSERT INTO animal (nome, raca) VALUES (?,?)';
    int linhasAfetadas = await _db.rawInsert(_sql, [animal.nome, animal.raca]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluir(int id) async {
    _db = await Conexao.getConexao();
    _sql = 'DELETE FROM animal WHERE id =?';
    int linhasAfetadas = await _db.rawDelete(_sql, [id]);
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
    } finally {
      db.close();
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
    } finally {
      db.close();
    }
  }
}
