/*Resposta Questões*/ 

/*1*/ SELECT MAX(dt_prova) , MIN(dt_prova) FROM prova; 
/*2*/ SELECT COUNT(pi.pais) piloto, pa.cd_pais pais FROM piloto pi LEFT JOIN pais pa ON pi.pais = pa.cd_pais WHERE pi.pais = 3; 
/*3*/ SELECT COUNT(*) FROM prova WHERE dt_prova LIKE '%-11-%'; 
/*4*/  SELECT nome.nm_eq equipe, p.nm_pais pais FROM equipe nome LEFT JOIN pais p ON nome.pais = p.cd_pais;  
/*5*/ SELECT nome.nm_cir circuito, p.nm_pais pais FROM circuito nome LEFT JOIN pais p ON nome.pais = p.cd_pais; 
/*6*/ SELECT d.dt_prova prova FROM prova d LEFT JOIN circuito n ON d.cd_pro = n.cd_cir WHERE n.cd_cir = 9;  
/*7*/ SELECT nome.nm_cir circuito FROM circuito nome INNER JOIN prova d ON nome.cd_cir = d.cd_pro WHERE d.dt_prova LIKE '%-12-%'; 
/*8*/ SELECT c.nm_cir circuito, p.nm_pais pais, d.dt_prova prova FROM circuito c LEFT JOIN pais p ON c.pais = p.cd_pais LEFT JOIN prova d ON c.cd_cir = d.cd_pro; 
/*9*/ SELECT p.nm_pil piloto, COUNT(pos.posicao) piloto_pos FROM piloto p LEFT JOIN piloto_pos pos ON p.cd_pil = pos.piloto WHERE p.cd_pil = 12 AND pos.posicao = 1; 
/*10*/  SELECT p.nm_pil piloto, COUNT(pos.posicao) piloto_pos FROM piloto p LEFT JOIN piloto_pos pos ON p.cd_pil = pos.piloto WHERE pos.posicao = 1 GROUP BY p.nm_pil;
/*11*/ SELECT p.posicao piloto_pos, nome.nm_pil piloto FROM piloto_pos p LEFT JOIN piloto nome ON p.piloto = nome.cd_pil WHERE p.prova = 4 AND p.posicao BETWEEN 1 AND 3 ORDER BY p.posicao; 
/*12*/ SELECT nome.nm_eq equipe, p.nm_pais pais FROM pais p LEFT JOIN equipe nome ON nome.pais = p.cd_pais ORDER BY nome.nm_eq , p.nm_pais;
/*13*/  SELECT nome.nm_pil piloto FROM piloto nome JOIN piloto_pos p  ON nome.cd_pil = p.piloto WHERE p.posicao = 1 GROUP BY nome.nm_pil HAVING COUNT(nome.nm_pil) >= 1;
/*14*/ SELECT nome.nm_pil piloto, nomeEq.nm_eq equipe FROM piloto nome LEFT JOIN equipe nomeEq ON nome.equipe = nomeEq.cd_eq JOIN piloto_pos p ON nome.cd_pil = p.piloto WHERE p.posicao = 1 GROUP BY nome.nm_pil HAVING COUNT(nome.nm_pil) >= 1; 