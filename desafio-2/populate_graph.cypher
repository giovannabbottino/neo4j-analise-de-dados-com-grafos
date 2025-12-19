UNWIND [
  {
    usuario: "Ana",
    musica: "Garota de Ipanema",
    artista: "Tom Jobim",
    genero: "Bossa Nova"
  },
  {
    usuario: "Bruno",
    musica: "Construção",
    artista: "Chico Buarque",
    genero: "MPB"
  },
  {
    usuario: "Carla",
    musica: "Pais e Filhos",
    artista: "Legião Urbana",
    genero: "Rock Nacional"
  },
  {
    usuario: "Daniel",
    musica: "Evidências",
    artista: "Chitãozinho e Xororó",
    genero: "Sertanejo"
  },
  {
    usuario: "Eduarda",
    musica: "Asa Branca",
    artista: "Luiz Gonzaga",
    genero: "Forró"
  },
  {
    usuario: "Felipe",
    musica: "Trem das Onze",
    artista: "Adoniran Barbosa",
    genero: "Samba"
  },
  {
    usuario: "Gabriela",
    musica: "Velha Infância",
    artista: "Tribalistas",
    genero: "Pop"
  },
  {
    usuario: "Henrique",
    musica: "Ainda Bem",
    artista: "Marisa Monte",
    genero: "MPB"
  },
  {
    usuario: "Isabela",
    musica: "Tempo Perdido",
    artista: "Legião Urbana",
    genero: "Rock Nacional"
  },
  {
    usuario: "João",
    musica: "O Mundo é um Moinho",
    artista: "Cartola",
    genero: "Samba"
  }
] AS dado

MERGE (u:Usuario {nome: dado.usuario})
MERGE (m:Musica  {nome: dado.musica})
MERGE (a:Artista {nome: dado.artista})
MERGE (g:Genero  {nome: dado.genero})

MERGE (u)-[:ESCUTA]->(m)
MERGE (u)-[:CURTE]->(g)
MERGE (u)-[:SEGUE]->(a)
MERGE (m)-[:TEM_GENERO]->(g)
MERGE (a)-[:TOCA]->(m);
