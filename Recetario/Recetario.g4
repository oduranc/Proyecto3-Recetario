grammar Recetario;

//Parsing Rules
recetario : (receta)+ EOF ;

receta : nombre porciones preparacion? coccion? calorias? ingredientes? elaboracion?;

nombre : GUION RECETA SEP TEXT SP?;
porciones : GUION PORCIONES SEP NUMBER SP TEXT SP? ;
preparacion : GUION PREPARACION SEP NUMBER SP TEXT SP? ;
coccion : GUION COCCION SEP NUMBER SP TEXT SP? ;
calorias : GUION CALORIAS SEP NUMBER SP TEXT SP? ;
ingredientes: GUION INGREDIENTES SEP ing_item+ SP? ;
elaboracion: GUION ELABORACION SEP ela_item+ SP?;
ing_item :  NUMBER unit=(CUCHARADITA|CUCHARADA|TAZA)? SP? TEXT ING_ITEM_SP? ;
ela_item :  NUMBER PASOS_SP SP? TEXT SP? ;

//Lexer Rules
GUION : '- ' ;
RECETA : 'RECETA' ;
PORCIONES : 'PORCIONES' ;
PREPARACION : 'TIEMPO PREPARACION' ;
COCCION : 'TIEMPO COCCION' ;
CALORIAS : 'CALORIAS' ;
INGREDIENTES : 'INGREDIENTES' ;
ELABORACION : 'ELABORACION' ;
CUCHARADITA : SP? 'cucharadita' SP? | SP? 'cucharaditas' SP? ;
CUCHARADA : SP? 'cucharada' SP? | SP? 'cucharadas' SP? ;
TAZA : SP? 'taza' SP? | SP? 'tazas' SP? ;
 
SEP : SP? ':' SP? ;
SP : ' '+ ;

NUMBER : [0-9]+'.'?[0-9]* ;
TEXT : WORD (SP WORD)* ;
WORD : [A-Za-z_]+ ;
ING_ITEM_SP : ',' ;
PASOS_SP : ')' ;

WS: [\n\r\t] -> skip ;