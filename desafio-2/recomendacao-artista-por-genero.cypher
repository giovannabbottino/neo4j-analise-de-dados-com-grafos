MATCH (u:Usuario)-[:CURTE]->(g:Genero)<-[:TEM_GENERO]-(m:Musica)<-[:TOCA]-(a:Artista)
WHERE u.nome = $usuario
  AND NOT (u)-[:SEGUE]->(a)
RETURN DISTINCT 
    a.nome AS Artista_Recomendado,
    g.nome AS Genero;
