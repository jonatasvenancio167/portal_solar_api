<h1>API de Geradores - Ruby on Rails 7</h1>
<h2>Visão Geral</h2>
<p>Este projeto consiste em uma API desenvolvida em Ruby on Rails versão 7, projetada para retornar informações sobre geradores baseados na despesa de luz do usuário. A API fornece tanto os dados dos geradores quanto um PDF gerado com essas informações.</p>

<h2>Tecnologias Utilizadas</h2>
<ul>
  <li>
    Ruby on Rails 7: Framework principal para desenvolvimento da API.
  </li>
  <li>
    PostgreSQL: Banco de dados utilizado para armazenar informações dos geradores e despesas de luz dos usuários.
  </li>
</ul>

<h2>Instalação</h2>

```bash
  git clone https://github.com/jonatasvenancio167/portal_solar_api
  cd https://github.com/jonatasvenancio167/portal_solar_api
```

```bash
  bundle install
```

<p>Certifique-se de que o PostgreSQL está instalado e em execução. </br>
Configure o arquivo <strong>config/database.yml</strong> com suas credenciais do PostgreSQL.</p>

<h2>Crie e migre o banco de dados:</h2>

```bash
  rails db:create
  rails db:migrate
  rails s
```

<h2>Funcionalidades</h2>

<strong>Endpoints Principais</strong>

<li>Usuário</li>

```bash
  POST /clients

  {
    "clients": 
    {
      "name": "teste",
      "email": "teste@email.com",
      "password": "123456"
      "password_confirmation": "123456" 
    }
  }

```

Cadastra um cliente ao sistema

```bash
  POST /clients/sign_in

  {
    "clients": 
    {
      "email": "teste@email.com",
      "password": "123456"
    }
  }

```

Realiza o login do cliente

```bash
  DELETE /clients
```

Deleta o usuário logado

```bash
  PUT /clients

  {
    "clients": 
    {
      "email": "teste@email.com.br",
    }
  }

```

Realiza a atualização no cadastro do usuário logado

```bash
  POST /simulations

  {
    "simulation": 
    {
      "account_value": 300.00
    }
  }

```
Realiza a simulação dos geradores baseado na conta de luz do usuário
