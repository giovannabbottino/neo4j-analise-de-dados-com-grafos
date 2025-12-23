// =====================================================
// 1) Recomendar pessoas para seguir com base em postagens curtidas em comum
// Ideia: pessoas que curtiram as MESMAS postagens que eu curti (mas que eu ainda não sigo)
// Parâmetros: $me (id do usuário), $limit (opcional)
// =====================================================
MATCH (me:Usuario {id: $me})-[:REALIZA]->(:Curtida)-[:REFERE-SE]->(p:Postagem)
MATCH (cand:Usuario)-[:REALIZA]->(:Curtida)-[:REFERE-SE]->(p)
WHERE cand <> me
  AND NOT (me)-[:SEGUE]->(cand)
WITH cand, count(DISTINCT p) AS curtidasEmComum
WHERE curtidasEmComum >= 1
RETURN cand.id    AS idRecomendado,
       cand.nome  AS nomeRecomendado,
       curtidasEmComum
ORDER BY curtidasEmComum DESC, nomeRecomendado ASC
LIMIT coalesce($limit, 10);


// =====================================================
// 2) Com base em quem eu sigo, recomende uma pessoa se ela tiver MAIS DE 5 seguidores em comum
// Interpretação: "seguidores em comum" = pessoas que eu sigo e que também seguem o candidato
// Parâmetros: $me (id do usuário)
// =====================================================
MATCH (me:Usuario {id: $me})-[:SEGUE]->(s:Usuario)
MATCH (s)-[:SEGUE]->(cand:Usuario)
WHERE cand <> me
  AND NOT (me)-[:SEGUE]->(cand)
WITH cand, count(DISTINCT s) AS seguidoresEmComum
WHERE seguidoresEmComum > 5
RETURN cand.id   AS idRecomendado,
       cand.nome AS nomeRecomendado,
       seguidoresEmComum
ORDER BY seguidoresEmComum DESC, nomeRecomendado ASC
LIMIT 1;


// =====================================================
// 3) Qual foi a postagem mais curtida no último mês?
// Usa o timestamp da Curtida (nó intermediário) para filtrar.
// Se quiser "últimos 30 dias", é exatamente isso.
// =====================================================
MATCH (c:Curtida)-[:REFERE-SE]->(p:Postagem)
WHERE c.dataHora >= datetime() - duration({days: 30})
WITH p, count(c) AS totalCurtidas
RETURN p.id    AS idPostagem,
       p.texto AS texto,
       totalCurtidas
ORDER BY totalCurtidas DESC, idPostagem ASC
LIMIT 1;
