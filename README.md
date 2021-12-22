Api-Rick-And-Morty-Integration


O primeiro passo foi criar a UI, a parte mais importante de todo código, tendo e vista que não se tratava de um projeto tão grande, apenas 2 View controllers interligadas por uma segue, já atenderiam as necessidades dessa demanda, intermediada por uma nagiation controller, a Ui estava quase finalizada, faltando uma tableView e os elementos que iriam receber da api as informações mais detalhadas sobre o personagem. Feito isso e criado todos os outlets, passamos para o backend.  Como estavamos trabalhando com MVVM ja aproveitei e adicionei o Storyboard a pasta VIew

Dentro de uma classe chamada <Person> Criei um Struct base  chamado {ApiRest}  para comportar outro Struct, chamado {Result}, que já recebia as variáveis com os nomes exatamente de acordo  com os titles dos dados JSON que a API iria consumir. Ali se encontrava basicamente nosso modelo de negócio, então nada mais justo que essa nossa classe se tornar o Model da nossa arquitetura MVVM.

  3 passo, agora precisariamos realmente trabalhar com as as informações, mas pra isso necessitariamos converter las antes, para que se tornassem realmente algo iterativo, nossa classe <Parser> faz isso por nos, abrindo uma sessão já para podermos trabalhar com esse tipo de consumo de dados. basicamente a lógica dizia, se tudo ocorrese como esperado, sem nenhum erro, o script decodificaria nossa {ApiRest} trazendo as informações como resultado.
  A classe <Parser> neste cenário toma o papel de nossa viewModel
  
  De alguma forma precisamos mostrar isso na tela, para isso, fizemos uma extension da view controller ainda dentro da mesma para podermos trabalhar com os dados da table view, ou melhor dizendo:
            extension ViewController:UITableViewDataSource 

E com 3 pequenas funções solucionariamos tudo, utilizamos primeiro a função numberOfRowsInSection que retorna em um int o numeros de linhas da seção,
a segunda é a cellForRowAt que será onde a mágica acontece, quando criamos os outles dos elementos, também criamos um indentifier para as celulas da tableView que apelidamos de "Cell", criei uma váriável com o mesmo nome e declarei que a "Cell" seria igual ao resultado da API de acordo com cada index, que no momento trazia apenas o nome dos personagens.

Sobreescrevendo o  metodo ViewDidLoad, instanciamos a classe <Parser> lá para que o decodable seja a primeira cois aque o app faça quando o mesmo for carregado e estiver pronto para uso. Pronto, adicinado mais alguns recursos de otimização de dados como o reloadData, o app já estava apresentando os personagens fornecidos pelo API. Agora restava a segunda parte que era apresentar mais detalhes dos personagens.

Essa segunda View, é controlada não pela ViewController mas sim por uma classe feita especialmente para isso, chamadada PersonViewController, que também entrará na pasta, controller junto com a ViewController encerrando o ciclo MVVM. Nessa classe criei uma variável chamada [var person] do tipo do nosso Struct, que continha todas as informações necessárias, e como os outles ja tinnham sido criados, no metodo ViewDidLoad apenas declarei que o texto desses respectivos elementos eram iguais aqueles que forem encontrados de acordo com o title na API, e lá estava funcionando também.  Faltando apenas a imagem passei um bom tentando implementar essa vizualização, mas o o console sempre retornava o mesmo erro 
{

A server with the specified hostname could not be found." UserInfo={NSUnderlyingError=0x600003d00fc0 {Error Domain=kCFErrorDomainCFNetwork Code=-1003 "(null)"

} Pesquisei bastante sobre ele, e pelo que entendi, é um erro  no servidor da API e não no codigo, gostaria de saber se realmente é isso, ou se esqueci de alguma propriedade ou fiz algo de errado.

E por fim, é isto. 



