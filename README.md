# Prova Técnica: Variação de Ativo Usando Backend em .NET ou Ruby on Rails e Frontend em Angular ou JavaScript ou Mobile Flutter

## Desafio
Este desafio consiste em criar uma aplicação fullstack que consulte a variação de preço de um ativo financeiro nos últimos 30 pregões. Você deve consumir os dados da [API do Yahoo Finance](https://finance.yahoo.com/) e exibir as variações de preço. A aplicação deve ser composta por:

- Um backend implementado em .NET Core ou Ruby on Rails.
- Um frontend implementado em Angular ou JavaScript puro.
- Opcional: um aplicativo mobile em Flutter.

| Dia   | Data          |  Valor    | Variação em relaçào a D-1     | Variação em relação a primeira data
|-      | -             | -         | -                             | - 
|2      |  01/01/2021   |  R$ 1,00  | -                             | -
|3      |  02/01/2021   |  R$ 1,10  | 10%                           | 10%
|4      |  03/01/2021   |  R$ 1,05  | -4,54%                        | 5%
|5      |  04/01/2021   |  R$ 1,90  | 80,95%                        | 90%

## Objetivos

### 1. **Backend (em .NET ou Ruby on Rails)**:
   - Implementar um serviço que consulte a API do Yahoo Finance e obtenha o preço de um ativo (exemplo: PETR4).
   - Armazenar os dados obtidos (preço de abertura dos últimos 30 pregões) em uma base de dados à sua escolha.
   - Implementar uma API REST que retorne os dados dos últimos 30 pregões, incluindo:
     - A variação percentual do preço de um dia para o outro.
     - A variação percentual em relação ao primeiro pregão.
   - **Pontos adicionais**: incluir testes unitários e usar padrões de projeto adequados.
   
### 2. **Frontend (em Angular ou JavaScript)**:
   - Criar uma página que consuma a API implementada no backend.
   - Exibir os dados dos últimos 30 pregões em uma tabela, incluindo as variações calculadas.
   - Incluir um gráfico que mostre a evolução do preço ao longo dos 30 pregões.
   - O gráfico deve ser interativo e responsivo, apresentando visualmente a variação percentual.
   
### 3. **Mobile (em Flutter)**:
   - Implementar um aplicativo mobile que consulte diretamente a API do Yahoo Finance para obter os preços de um ativo (exemplo: PETR4).
   - Exibir os preços dos últimos 30 pregões em uma lista, incluindo a variação percentual entre os pregões.
   - Incluir um gráfico em Flutter que mostre a variação do preço do ativo ao longo dos 30 pregões.
   - Implementar a possibilidade de consultar múltiplos ativos no aplicativo.
   - **Pontos adicionais**: implementar gráficos interativos com animações e exibir notificações sobre grandes variações de preço.

## Requisitos Técnicos
- **Backend**:
  - Utilize .NET Core ou Ruby on Rails para implementar a API.
  - A API deve ser documentada e exposta via Swagger (ou equivalente).
  - Utilize qualquer banco de dados (relacional ou NoSQL) para persistência.
  - O código do backend deve estar disponível em um repositório público no GitHub.

- **Frontend**:
  - Utilize Angular ou JavaScript puro para desenvolver a página web.
  - A página deve ser responsiva e funcional em dispositivos móveis.
  - O código do frontend deve estar disponível em um repositório público no GitHub.

- **Mobile**:
  - Utilize Flutter para implementar o aplicativo mobile.
  - O aplicativo deve bater diretamente na API do Yahoo Finance e exibir a variação do preço em tempo real.
  - O código do aplicativo deve estar disponível em um repositório público no GitHub.

## Exemplos de Consulta de API do Yahoo Finance:
- API de consulta para PETR4: `https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA`
- Os valores de abertura podem ser extraídos de `chart.result.indicators.quote.open`, e as datas dos pregões de `chart.result.timestamp`.

## Avaliação
A solução será avaliada com base nos seguintes critérios:
- Correção do código e funcionalidade completa.
- Organização, estrutura e padrões de código.
- Criatividade e proatividade no desenvolvimento.
- Testes unitários e documentação.
- Qualidade do frontend (design, usabilidade e performance).
- Qualidade do aplicativo mobile (design, experiência do usuário e performance).

## Pontos Extras:

- **Consulta de Múltiplos Ativos**:
  - Implementar a funcionalidade para o usuário selecionar e consultar a variação de múltiplos ativos simultaneamente.
  - Exibir comparações lado a lado das variações de preços entre diferentes ativos.

- **Gráficos Avançados**:
  - Utilizar bibliotecas avançadas de gráficos (como Chart.js, D3.js ou similar) para criar visualizações mais complexas, como gráficos de velas (candlestick) ou gráficos interativos com zoom e tooltip detalhados.

- **Análises Estatísticas**:
  - Implementar análises adicionais, como média móvel, volatilidade ou outras métricas financeiras com base nos preços dos ativos.
  - Exibir essas informações no frontend como complementos aos gráficos.

- **Filtro de Datas Personalizado**:
  - Permitir que o usuário escolha um intervalo de datas personalizado para consultar a variação do ativo, além dos últimos 30 pregões.

- **Sistema de Notificações**:
  - Implementar notificações (via e-mail ou no próprio frontend/mobile) para alertar o usuário sobre variações críticas de preço ou mudanças significativas em um ativo.

- **Funcionalidades de Exportação**:
  - Adicionar uma opção para exportar os dados exibidos (preços e variações) em formatos como CSV ou PDF.

- **Autenticação e Autorização**:
  - Implementar um sistema básico de autenticação de usuários e permitir que cada usuário salve seus ativos favoritos para consulta rápida.

- **Desempenho e Cache**:
  - Implementar cache de consultas no backend para evitar múltiplas requisições à API externa e melhorar o desempenho da aplicação.

- **Testes Automatizados**:
  - Implementar testes automatizados de integração e end-to-end (E2E) para garantir a qualidade do sistema.

## Entrega
- Disponibilize o código em um repositório no GitHub, incluindo:
  - Um arquivo `README.md` explicando como configurar e executar o projeto.
  - Scripts de configuração do banco de dados e instruções detalhadas sobre como rodar a aplicação.
  - Se for o caso de desenvolvimento mobile, incluir instruções detalhadas para execução do app.

Boa sorte e mostre sua criatividade e habilidades!
