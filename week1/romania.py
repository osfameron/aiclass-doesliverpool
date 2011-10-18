graph = {
    'Arad'   : [ ('Zerind',75), ('Sibiu', 140), ('Timisoara',118) ],
    'Zerind' : [ ('Arad', 75), ('Oradea', 71) ],
    'Oradea' : [ ('Zerind', 71), ('Sibiu', 151) ],
    'Sibiu'  : [ ('Arad', 140), ('Oradea', 151), ('Fagaras', 99), ('Rimnicu Vilcea', 80) ],
    'Timisoara' : [ ('Arad', 118), ('Lugoj', 111) ],
    'Lugoj'  : [ ('Timisoara', 111), ('Mehadia', 70) ],
    'Mehadia' : [ ('Lugoj', 70), ('Drobeta', 75) ],
    'Drobeta' : [ ('Mehadia', 75), ('Crulova', 120) ],
    'Crulova' : [ ('Drobeta', 120), ('Rimnicu Vilcea', 146), ('Pitesti', 138) ],
    'Rimnicu Vilcea' : [ ('Sibiu', 80), ('Crulova', 146), ('Pitesti', 97) ],
    'Pitesti' : [ ('Rimnicu Vilcea', 97), ('Crulova', 138), ('Bucharest', 101) ],
    'Fagaras' : [ ('Sibiu', 99), ('Bucharest', 211) ],
    'Bucharest' : [ ('Pitesti', 101), ('Fagaras', 211), ('Giurgiu', 90), ('Urziceni', 85) ],
    'Giurgiu'   : [ ('Bucharest', 90), ('Vaslui', 142), ('Hirsova', 98) ],
    'Hirsova'   : [ ('Urziceni', 98), ('Eforie', 86) ],
    'Eforie'    : [ ('Hirsova', 86) ],
    'Vaslui'    : [ ('Urziceni', 142), ('Tasi', 92) ],
    'Tasi'      : [ ('Vaslui', 92), ('Neamt', 97) ],
    'Neamt'     : [ ('Tasi', 97) ]
};

print graph;
