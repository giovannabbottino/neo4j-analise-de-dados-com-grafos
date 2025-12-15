// ===== GENRES =====
CREATE
(:Genre {name: "Drama"}),
(:Genre {name: "Comedy"}),
(:Genre {name: "Action"}),
(:Genre {name: "Sci-Fi"}),
(:Genre {name: "Fantasy"}),
(:Genre {name: "Thriller"}),
(:Genre {name: "Romance"}),
(:Genre {name: "Horror"}),
(:Genre {name: "Adventure"}),
(:Genre {name: "Crime"});

// ===== USERS =====
CREATE
(:User {name: "Alice"}),
(:User {name: "Bruno"}),
(:User {name: "Carla"}),
(:User {name: "Daniel"}),
(:User {name: "Eduarda"}),
(:User {name: "Felipe"}),
(:User {name: "Gabriela"}),
(:User {name: "Henrique"}),
(:User {name: "Isabela"}),
(:User {name: "João"});

// ===== MOVIES =====
CREATE
(m1:Movie {name: "The Last Journey"}),
(m2:Movie {name: "Silent City"}),
(m3:Movie {name: "Broken Code"}),
(m4:Movie {name: "Red Horizon"}),
(m5:Movie {name: "Hidden Truth"}),
(m6:Movie {name: "Nightfall"}),
(m7:Movie {name: "Final Signal"}),
(m8:Movie {name: "Echoes"}),
(m9:Movie {name: "Deep Waters"}),
(m10:Movie {name: "Cold Justice"});

// ===== SERIES =====
CREATE
(s1:SERIES {name: "Dark Paths"}),
(s2:SERIES {name: "Future Line"}),
(s3:SERIES {name: "Lost Minds"}),
(s4:SERIES {name: "Urban Legends"}),
(s5:SERIES {name: "Beyond Time"}),
(s6:SERIES {name: "Silent Wars"}),
(s7:SERIES {name: "Broken Lives"}),
(s8:SERIES {name: "Neon City"}),
(s9:SERIES {name: "Hidden Files"}),
(s10:SERIES {name: "Last Stand"});

// ===== ACTORS =====
CREATE
(a1:Actor {name: "Lucas Silva"}),
(a2:Actor {name: "Marina Costa"}),
(a3:Actor {name: "Rafael Lima"}),
(a4:Actor {name: "Ana Torres"}),
(a5:Actor {name: "Pedro Rocha"}),
(a6:Actor {name: "Juliana Alves"}),
(a7:Actor {name: "Thiago Mendes"}),
(a8:Actor {name: "Camila Pires"}),
(a9:Actor {name: "Bruno Farias"}),
(a10:Actor {name: "Laura Nogueira"});

// ===== DIRECTORS =====
CREATE
(d1:Director {name: "Carlos Monteiro"}),
(d2:Director {name: "Fernanda Lopes"}),
(d3:Director {name: "Ricardo Azevedo"}),
(d4:Director {name: "Paula Mendes"}),
(d5:Director {name: "André Cunha"}),
(d6:Director {name: "Sofia Ribeiro"}),
(d7:Director {name: "Marcos Teixeira"}),
(d8:Director {name: "Renata Pacheco"}),
(d9:Director {name: "Eduardo Vasconcelos"}),
(d10:Director {name: "Luciana Prado"});

// ===== IN_GENRE (Movies & Series) =====
MATCH
(m1:Movie {name:"The Last Journey"}),(g1:Genre {name:"Adventure"}),
(m2:Movie {name:"Silent City"}),(g2:Genre {name:"Crime"}),
(m3:Movie {name:"Broken Code"}),(g3:Genre {name:"Sci-Fi"}),
(m4:Movie {name:"Red Horizon"}),(g4:Genre {name:"Action"}),
(m5:Movie {name:"Hidden Truth"}),(g5:Genre {name:"Thriller"}),
(m6:Movie {name:"Nightfall"}),(g6:Genre {name:"Horror"}),
(m7:Movie {name:"Final Signal"}),(g7:Genre {name:"Sci-Fi"}),
(m8:Movie {name:"Echoes"}),(g8:Genre {name:"Drama"}),
(m9:Movie {name:"Deep Waters"}),(g9:Genre {name:"Romance"}),
(m10:Movie {name:"Cold Justice"}),(g10:Genre {name:"Crime"})
CREATE
(m1)-[:IN_GENRE]->(g1),
(m2)-[:IN_GENRE]->(g2),
(m3)-[:IN_GENRE]->(g3),
(m4)-[:IN_GENRE]->(g4),
(m5)-[:IN_GENRE]->(g5),
(m6)-[:IN_GENRE]->(g6),
(m7)-[:IN_GENRE]->(g7),
(m8)-[:IN_GENRE]->(g8),
(m9)-[:IN_GENRE]->(g9),
(m10)-[:IN_GENRE]->(g10);

MATCH
(s1:SERIES {name:"Dark Paths"}),(g1:Genre {name:"Drama"}),
(s2:SERIES {name:"Future Line"}),(g3:Genre {name:"Sci-Fi"}),
(s3:SERIES {name:"Lost Minds"}),(g5:Genre {name:"Thriller"}),
(s4:SERIES {name:"Urban Legends"}),(g6:Genre {name:"Horror"}),
(s5:SERIES {name:"Beyond Time"}),(g4:Genre {name:"Action"}),
(s6:SERIES {name:"Silent Wars"}),(g10:Genre {name:"Crime"}),
(s7:SERIES {name:"Broken Lives"}),(g8:Genre {name:"Drama"}),
(s8:SERIES {name:"Neon City"}),(g3:Genre {name:"Sci-Fi"}),
(s9:SERIES {name:"Hidden Files"}),(g2:Genre {name:"Crime"}),
(s10:SERIES {name:"Last Stand"}),(g9:Genre {name:"Romance"})
CREATE
(s1)-[:IN_GENRE]->(g1),
(s2)-[:IN_GENRE]->(g3),
(s3)-[:IN_GENRE]->(g5),
(s4)-[:IN_GENRE]->(g6),
(s5)-[:IN_GENRE]->(g4),
(s6)-[:IN_GENRE]->(g10),
(s7)-[:IN_GENRE]->(g8),
(s8)-[:IN_GENRE]->(g3),
(s9)-[:IN_GENRE]->(g2),
(s10)-[:IN_GENRE]->(g9);

// ===== ACTED_IN =====
MATCH
(a1:Actor {name:"Lucas Silva"}),(m1:Movie {name:"The Last Journey"}),
(a2:Actor {name:"Marina Costa"}),(m2:Movie {name:"Silent City"}),
(a3:Actor {name:"Rafael Lima"}),(m3:Movie {name:"Broken Code"}),
(a4:Actor {name:"Ana Torres"}),(m4:Movie {name:"Red Horizon"}),
(a5:Actor {name:"Pedro Rocha"}),(m5:Movie {name:"Hidden Truth"}),
(a6:Actor {name:"Juliana Alves"}),(m6:Movie {name:"Nightfall"}),
(a7:Actor {name:"Thiago Mendes"}),(m7:Movie {name:"Final Signal"}),
(a8:Actor {name:"Camila Pires"}),(m8:Movie {name:"Echoes"}),
(a9:Actor {name:"Bruno Farias"}),(m9:Movie {name:"Deep Waters"}),
(a10:Actor {name:"Laura Nogueira"}),(m10:Movie {name:"Cold Justice"})
CREATE
(a1)-[:ACTED_IN]->(m1),
(a2)-[:ACTED_IN]->(m2),
(a3)-[:ACTED_IN]->(m3),
(a4)-[:ACTED_IN]->(m4),
(a5)-[:ACTED_IN]->(m5),
(a6)-[:ACTED_IN]->(m6),
(a7)-[:ACTED_IN]->(m7),
(a8)-[:ACTED_IN]->(m8),
(a9)-[:ACTED_IN]->(m9),
(a10)-[:ACTED_IN]->(m10);

// ===== DIRECTED =====
MATCH
(d1:Director {name:"Carlos Monteiro"}),(m1:Movie {name:"The Last Journey"}),
(d2:Director {name:"Fernanda Lopes"}),(m2:Movie {name:"Silent City"}),
(d3:Director {name:"Ricardo Azevedo"}),(m3:Movie {name:"Broken Code"}),
(d4:Director {name:"Paula Mendes"}),(m4:Movie {name:"Red Horizon"}),
(d5:Director {name:"André Cunha"}),(m5:Movie {name:"Hidden Truth"}),
(d6:Director {name:"Sofia Ribeiro"}),(m6:Movie {name:"Nightfall"}),
(d7:Director {name:"Marcos Teixeira"}),(m7:Movie {name:"Final Signal"}),
(d8:Director {name:"Renata Pacheco"}),(m8:Movie {name:"Echoes"}),
(d9:Director {name:"Eduardo Vasconcelos"}),(m9:Movie {name:"Deep Waters"}),
(d10:Director {name:"Luciana Prado"}),(m10:Movie {name:"Cold Justice"})
CREATE
(m1)<-[:DIRECTED]-(d1),
(m2)<-[:DIRECTED]-(d2),
(m3)<-[:DIRECTED]-(d3),
(m4)<-[:DIRECTED]-(d4),
(m5)<-[:DIRECTED]-(d5),
(m6)<-[:DIRECTED]-(d6),
(m7)<-[:DIRECTED]-(d7),
(m8)<-[:DIRECTED]-(d8),
(m9)<-[:DIRECTED]-(d9),
(m10)<-[:DIRECTED]-(d10);

// ===== WATCHED =====
MATCH
(u1:User {name:"Alice"}),(m1:Movie {name:"The Last Journey"}),(s1:SERIES {name:"Dark Paths"}),
(u2:User {name:"Bruno"}),(m2:Movie {name:"Silent City"}),(s2:SERIES {name:"Future Line"}),
(u3:User {name:"Carla"}),(m3:Movie {name:"Broken Code"}),(s3:SERIES {name:"Lost Minds"}),
(u4:User {name:"Daniel"}),(m4:Movie {name:"Red Horizon"}),(s4:SERIES {name:"Urban Legends"}),
(u5:User {name:"Eduarda"}),(m5:Movie {name:"Hidden Truth"}),(s5:SERIES {name:"Beyond Time"}),
(u6:User {name:"Felipe"}),(m6:Movie {name:"Nightfall"}),(s6:SERIES {name:"Silent Wars"}),
(u7:User {name:"Gabriela"}),(m7:Movie {name:"Final Signal"}),(s7:SERIES {name:"Broken Lives"}),
(u8:User {name:"Henrique"}),(m8:Movie {name:"Echoes"}),(s8:SERIES {name:"Neon City"}),
(u9:User {name:"Isabela"}),(m9:Movie {name:"Deep Waters"}),(s9:SERIES {name:"Hidden Files"}),
(u10:User {name:"João"}),(m10:Movie {name:"Cold Justice"}),(s10:SERIES {name:"Last Stand"})
CREATE
(u1)-[:WATCHED {rating: 4.5}]->(m1),
(u1)-[:WATCHED {rating: 5.0}]->(s1),
(u2)-[:WATCHED {rating: 4.0}]->(m2),
(u2)-[:WATCHED {rating: 4.8}]->(s2),
(u3)-[:WATCHED {rating: 3.5}]->(m3),
(u3)-[:WATCHED {rating: 4.2}]->(s3),
(u4)-[:WATCHED {rating: 4.7}]->(m4),
(u4)-[:WATCHED {rating: 4.0}]->(s4),
(u5)-[:WATCHED {rating: 4.1}]->(m5),
(u5)-[:WATCHED {rating: 4.9}]->(s5),
(u6)-[:WATCHED {rating: 3.9}]->(m6),
(u6)-[:WATCHED {rating: 4.3}]->(s6),
(u7)-[:WATCHED {rating: 4.6}]->(m7),
(u7)-[:WATCHED {rating: 4.1}]->(s7),
(u8)-[:WATCHED {rating: 4.0}]->(m8),
(u8)-[:WATCHED {rating: 4.4}]->(s8),
(u9)-[:WATCHED {rating: 4.8}]->(m9),
(u9)-[:WATCHED {rating: 4.6}]->(s9),
(u10)-[:WATCHED {rating: 4.2}]->(m10),
(u10)-[:WATCHED {rating: 4.7}]->(s10);
