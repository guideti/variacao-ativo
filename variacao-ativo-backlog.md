**Desafio para Avaliação do Candidato: Estruturação do Backlog para Aplicativo Mobile de Consulta de Ativos do Yahoo Finance**


**Contexto:**
O aplicativo fornecerá informações detalhadas sobre um ativo financeiro com base nos dados disponíveis na API do Yahoo Finance. A seguir, estão os principais campos disponíveis para um ativo:

```json
{
  "currency": "...",
  "symbol": "...",
  "exchangeName": "...",
  "instrumentType": "...",
  "firstTradeDate": "...",
  "regularMarketTime": "...",
  "gmtoffset": "...",
  "timezone": "...",
  "exchangeTimezoneName": "...",
  "regularMarketPrice": "...",
  "chartPreviousClose": "...",
  "previousClose": "...",
  "scale": "...",
  "priceHint": "...",
  "currentTradingPeriod": "...",
  "timestamp": [...],
  "indicators": {...},
  "quote": [...],
  "dataGranularity": "...",
  "range": "...",
  "validRanges": [...]
}
```

**Tarefa:**
Estruture um backlog para o desenvolvimento do aplicativo, considerando as seguintes funcionalidades:

1. **Consulta de Ativo:**
   - Implementar a funcionalidade que permite ao usuário buscar informações sobre um ativo específico utilizando o símbolo da ação.

2. **Exibição de Informações Tabulares:**
   - Desenvolver uma interface que apresente de forma tabular as informações do ativo, como currency, symbol, exchangeName, regularMarketPrice, etc.

3. **Gráfico de Variação de Preço:**
   - Criar uma seção no aplicativo que exiba um gráfico de variação de preço ao longo do tempo, utilizando os dados fornecidos, como timestamp e quote.

4. **Configuração de Período no Gráfico:**
   - Permitir que o usuário escolha o período desejado para visualização no gráfico, considerando as opções disponíveis em validRanges.

5. **Personalização de Interface:**
   - Implementar opções de personalização da interface, como escolha de temas e configurações de exibição.

6. **Tratamento de Erros e Mensagens:**
   - Incluir funcionalidades que tratem possíveis erros na consulta de ativo e forneçam mensagens claras ao usuário.

### Sobre a entrega
:heavy_exclamation_mark: Use sua criatividade para estruturar sua solução. 

**Formato de Entrega:**
Apresente seu backlog em formato de lista, priorizando as funcionalidades e incluindo breves descrições e critérios de aceitação para cada uma. O backlog deverá ser disponibilizado em arquivo PDF.

**Prazo de Entrega:**
Você terá uma semana a partir de hoje para concluir o desafio.
