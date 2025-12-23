// =========================
// 1) CONSTRAINTS
// =========================
CREATE CONSTRAINT usuario_id_unico
IF NOT EXISTS
FOR (u:Usuario)
REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT curtida_unica_usuario_postagem
IF NOT EXISTS
FOR (c:Curtida)
REQUIRE (c.idUsuario, c.idPostagem) IS UNIQUE;

CREATE CONSTRAINT postagem_id_unico
IF NOT EXISTS
FOR (p:Postagem)
REQUIRE p.id IS UNIQUE;

// =========================
// 2) LIMPEZA (opcional)
// =========================
// Descomente se quiser recriar sempre do zero.
// MATCH (n) DETACH DELETE n;

// =========================
// 3) USUÁRIOS (10)
// =========================
UNWIND [
  {id: 1,  nome: "Ana Souza"},
  {id: 2,  nome: "Bruno Lima"},
  {id: 3,  nome: "Carla Mendes"},
  {id: 4,  nome: "Diego Ribeiro"},
  {id: 5,  nome: "Eduarda Alves"},
  {id: 6,  nome: "Felipe Costa"},
  {id: 7,  nome: "Gabriela Nunes"},
  {id: 8,  nome: "Henrique Martins"},
  {id: 9,  nome: "Isabela Rocha"},
  {id: 10, nome: "João Pereira"}
] AS row
MERGE (:Usuario {id: row.id})
SET   _.nome = row.nome;

// =========================
// 4) POSTAGENS (10)
// =========================
UNWIND [
  {id: 1,  texto: "Começando a semana com novos desafios no trabalho."},
  {id: 2,  texto: "Café passado na hora certa muda o dia de qualquer pessoa."},
  {id: 3,  texto: "Estudando grafos de conhecimento e curtindo muito o processo."},
  {id: 4,  texto: "Nada como uma caminhada no fim da tarde para organizar as ideias."},
  {id: 5,  texto: "Finalizando um projeto importante hoje. Alívio e orgulho."},
  {id: 6,  texto: "Aprender algo novo todos os dias faz diferença no longo prazo."},
  {id: 7,  texto: "Revisando artigos acadêmicos. Foco total nesta semana."},
  {id: 8,  texto: "Tecnologia e educação caminham juntas. Sempre."},
  {id: 9,  texto: "Boa conversa rende bons insights e melhora as decisões."},
  {id: 10, texto: "Encerrando a semana com sensação de dever cumprido."}
] AS row
MERGE (:Postagem {id: row.id})
SET   _.texto = row.texto;

// =========================
// 5) SEGUE (rede plausível)
// =========================
UNWIND [
  {a:1,  b:2},
  {a:2,  b:3},
  {a:3,  b:4},
  {a:4,  b:5},
  {a:5,  b:6},
  {a:6,  b:7},
  {a:7,  b:8},
  {a:8,  b:9},
  {a:9,  b:10},
  {a:10, b:1},
  {a:1,  b:3},
  {a:2,  b:5},
  {a:3,  b:7},
  {a:4,  b:8},
  {a:6,  b:9}
] AS row
MATCH (u1:Usuario {id: row.a})
MATCH (u2:Usuario {id: row.b})
MERGE (u1)-[:SEGUE]->(u2);

// =========================
// 6) PUBLICAÇÕES (10) - cada usuário publica uma postagem
// Data/hora no nó intermediário Publicacao
// =========================
UNWIND [
  {userId: 1,  postId: 1,  dataHora: "2025-01-06T08:15:00"},
  {userId: 2,  postId: 2,  dataHora: "2025-01-06T09:30:00"},
  {userId: 3,  postId: 3,  dataHora: "2025-01-06T10:45:00"},
  {userId: 4,  postId: 4,  dataHora: "2025-01-06T17:20:00"},
  {userId: 5,  postId: 5,  dataHora: "2025-01-07T11:10:00"},
  {userId: 6,  postId: 6,  dataHora: "2025-01-07T18:05:00"},
  {userId: 7,  postId: 7,  dataHora: "2025-01-08T07:55:00"},
  {userId: 8,  postId: 8,  dataHora: "2025-01-08T13:40:00"},
  {userId: 9,  postId: 9,  dataHora: "2025-01-09T09:05:00"},
  {userId: 10, postId: 10, dataHora: "2025-01-10T19:15:00"}
] AS row
MATCH (u:Usuario {id: row.userId})
MATCH (p:Postagem {id: row.postId})
CREATE (u)-[:REALIZA]->(pub:Publicacao {dataHora: datetime(row.dataHora)})
CREATE (pub)-[:REFERE-SE]->(p);

// =========================
// 7) CURTIDAS (10) - um usuário só pode curtir uma postagem uma vez
// Data/hora no nó intermediário Curtida (e constraint composta garante unicidade)
// =========================
UNWIND [
  {userId: 1,  postId: 3,  dataHora: "2025-01-06T12:05:00"},
  {userId: 2,  postId: 1,  dataHora: "2025-01-06T08:40:00"},
  {userId: 3,  postId: 5,  dataHora: "2025-01-07T11:45:00"},
  {userId: 4,  postId: 2,  dataHora: "2025-01-06T10:00:00"},
  {userId: 5,  postId: 8,  dataHora: "2025-01-08T14:10:00"},
  {userId: 6,  postId: 4,  dataHora: "2025-01-06T20:22:00"},
  {userId: 7,  postId: 6,  dataHora: "2025-01-07T19:30:00"},
  {userId: 8,  postId: 9,  dataHora: "2025-01-09T09:45:00"},
  {userId: 9,  postId: 7,  dataHora: "2025-01-08T08:20:00"},
  {userId: 10, postId: 2,  dataHora: "2025-01-06T11:12:00"}
] AS row
MATCH (u:Usuario {id: row.userId})
MATCH (p:Postagem {id: row.postId})
MERGE (c:Curtida {idUsuario: row.userId, idPostagem: row.postId})
ON CREATE SET c.dataHora = datetime(row.dataHora)
MERGE (u)-[:REALIZA]->(c)
MERGE (c)-[:REFERE-SE]->(p);
