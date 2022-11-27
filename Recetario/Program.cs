using Antlr4.Runtime;

var input = CharStreams.fromPath(@"..\..\..\recetas.txt");

Console.WriteLine("Los SQL INSERT son los siguientes:");

var lexer = new RecetarioLexer(input);
var tokenStream = new CommonTokenStream(lexer);
var parser = new RecetarioParser(tokenStream);
var tree = parser.recetario();
var recetario = new Recetario.Recetario();
recetario.Visit(tree);

int n = 0;
foreach (string line in recetario.Output)
{
    n++;
    Console.WriteLine(line);
}
Console.WriteLine("\nPresione una tecla para salir.");
Console.ReadKey();