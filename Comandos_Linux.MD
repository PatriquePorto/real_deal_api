https://phoenixnap.com/kb/postgres-create-user <-site com todos os comandos linux

Atualizar todo o sistema
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y

Desinstalar um repositorio
sudo apt autoremove --purge erlang

sudo -u postgres psql <- comando para acessar o PostgreSQL
\l <- comando para listar BD dentro do PostgreSQL
\c "db_name" <- comando para acessar um banco de dados postgres

sudo service postgresql restart
sudo -u postgres createuser --interactive
 service postgresql status
========================================================
Uninstall and remove PostgreSQL on Debian Linux

sudo apt-get --purge remove postgresql
sudo apt-get purge postgresql*
sudo apt-get --purge remove postgresql postgresql-doc postgresql-common

=================================================================

 rm -rf nome_da_pasta <- Apaga uma pastar no linux
ALTER USER <name> WITH PASSWORD '<password>'; <- Alterar senha do usuário PostgreSQL
 ALTER USER <name> WITH <option> adiciona previlegio no Postgresql




docker run --name meu-postgres -p7777:5432 -e POSTGRES_PASSWORD=SENHA_DO_USUÁRIO_POSTGRES -d postgres <- comando para criar imagem do postgres no Docker!
 psql -U postgres <- executar esse comando dentro do terminal do postgres no Docker, para acessar o BD!
 /usr/local/Cellar/postgresql/<version>/bin/createuser -s postgres <- depois executar esse comando para criar um usuário no Postgresql, o usuário criado acessa com a senha do primeiro comando!



 http post http://localhost:4000/api/trainers name="Patrique" password="123456" <- cria usuario no banco de dados
 http delete http://localhost:4000/api/trainers/id do usuario <- deleta um usuário no banco de dados

 ExMon.Repo.all(ExMon.Trainer) <- Verica usuarios criados no banco de dados!

 f54b5ada-380f-4883-8747-92cdf207ba85

 Comandos no terminal Elixir

 alias ExMon.PokeApi.Client

 http get http://localhost:4000/api/pokemons

Comando para aula 71
 ExMon.fetch_pokemon("pikachu")

 Para ver todas as distribuições do Linux disponíveis e seus sistemas de arquivos raiz no Explorador de Arquivos do Windows,
 insira \\wsl$ na barra de endereços


 http post http://localhost:4000/api/trainer_pokemons name=charmander nickname=julio trainer_id="ed3694ae-bd6c-4125-9ca0-ec3c775731fd"
