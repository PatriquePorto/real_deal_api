Acessar diretorio do linux no windows
\\wsl$

asdf commands
. $HOME/.asdf/asdf.sh



git push -u origin main <- enviar projeto para o github

CRIAR BANCO DE DADOS NO DOCKER
docker run --name meu-postgres -p7777:5432 -e POSTGRES_PASSWORD=SENHA_DO_USUÁRIO_POSTGRES -d postgres <- comando para criar imagem do postgres no Docker!
psql -U postgres <- executar esse comando dentro do terminal do postgres no Docker, para acessar o BD!
/usr/local/Cellar/postgresql/<version>/bin/createuser -s postgres <- depois executar esse comando para criar um usuário no Postgresql, o usuário criado acessa com a senha do primeiro comando!

mix phx.new nome-do-projeto --no-ecto --no-gettext --no-mailer --no-dashboard && cd nome-do-projeto <- iniciar um projeto Phoenix só com Front-End

rm -rf deps \_build <-- Comando pare remover deps \_build de projetos Phoenix Elixir com erro, depois é só rodar "mix deps.get" para refazer e rodar o projeto
rm -rf \_build
mix deps.clean --all
mix clean
mix deps.get
mix compile

rm nome-projeto -r <- comando para apagar um projeto

Para rodas os testes dos app em Elixir, verique as configurações de conexão do BD em Config -> test.exs
