# EmprestaCT_UF

# Funcionamento
A aplicação funciona com base em uma arquitetura MVC (Model View Controller). A aplicação inteira é executada dentro do arquivo index.php dentro da pasta public. Os demais arquivos são importados para dentro dela, com base na necessidade. Inicialmente importa o arquivo core.php, e dentro dele é chamado o routes.php. O arquivo routes.php contem um array bi-dimensional, contendo as diferentes path, seus respectivos controllers, e suas actions. Os controllers são objetos, que contem as actions, na forma de método, responsavel por executar cada path.

Em seguida, dentro do core é feita a busca entre os indices dos arrays de rotas, procurando uma path identica a url atual. Ao encontrar, será criada uma instancia do objeto controller, e, em seguida, executa o action dentro desse controller. Dentro dessa action, será executado o código back-end da aplicação, e (caso necessário), a renderização des views (front-end), pelo objeto Utils.php.

Operações no banco de dados serão feitas dentro dos models, objetos, que terão seus métodos chamados dentro dos controllers.
