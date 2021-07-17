# Nuuvem Dev Challenge
## Sobre o teste
É necessário gerar um projeto em Rails Full Stack capaz de gerenciar pedidos de restaurantes, utilizando, como entrada de informações arquivos de texto separados por tab.

## Documentação do projeto
1. Após baixar o projeto, utilize o comando abaixo para instalar as dependencias do projeto e criar o banco de dados.
```bash
    bundle
    rails db:migrate 
```

2. Os models do back end estão cobertos por testes usando a gem RSpec. Para rodar os testes criados, utilize o comando abaixo.
```bash
    rspec 
```

3. Inicialize o projeto com o comando abaixo, e entre em localhost:3000 ou 127.0.0.1:3000 
```bash
    rails s
```

4. Clique no link para acessar a página de orders, clique no + para entrar no formulário de criação de novos pedidos e envie o arquivo .txt separado por tabs no formato que foi informado no escopo do projeto.

5. Verifique as orders criadas em /orders (orders_path)
