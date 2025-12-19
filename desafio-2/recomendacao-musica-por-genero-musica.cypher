MATCH (u:Usuario {nome: $usuario})-[:ESCUTA]->(:Musica)-[:TEM_GENERO]->(g:Genero)
MATCH (mRec:Musica)-[:TEM_GENERO]->(g)
WHERE NOT (u)-[:ESCUTA]->(mRec)
RETURN 
  mRec.nome AS Musica_Recomendada,
  g.nome    AS Genero
ORDER BY g.nome, mRec.nome
LIMIT 10;
