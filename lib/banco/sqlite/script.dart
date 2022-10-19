final criar_banco = [
  """
    CREATE TABLE animal(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL,
      raca TEXT NOT NULL
    )""",
  """
    CREATE TABLE dono(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL,
      telefone INTEGER NOT NULL,
      cpf TEXT NOT NULL,
      cidade TEXT NOT NULL,
      bairro TEXT NOT NULL
    )
"""
];
