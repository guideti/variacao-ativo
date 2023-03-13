# Variação do Ativo

## Mobile
### iOS
1. Para o app iOS foi utilizado Alamofire para camada de network e dropdown para tableview gráfica para escolha de ativo.
2. Rodar o pod install na pasta do projeto iOS.
3. Foi utilizado a versão 13.4.1 do Xcode
4. Foi utilizado MVVM como arquitetura do projeto

### Flutter
1. Para o app flutter foi utilizado flutter_bloc para gerência de estados, get_it para injeção de dependência, dartz para programação funcional, equatable para comparação de classe, sync_fusion para construção do gráfico, mocktail para mock e bloc_test para testes no cubit.
2. Rodar o flutter pub get ao baixar o projeto, dentro do projeto Flutter
3. Foi utilizado a versão 3.7.7 do Flutter
4. Foi utilizado Clean Archtecture como arquitetura do projeto

## Requisitos
1. Implementar o core da aplicação a talea inicial em linguagem nativa. [x]
2. Para implementações android, considerar Java. []
3. Para implementações iOS, considerar UIKit. [x]
4. Consultar o preço do ativo na API do Yahoo Finance (este é um exemplo da consulta do ativo PETR4 https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA) [x]
5. Implementar uma tela em flutter que apresente a variação do preço do ativo nos últimos 30 pregões e mostre a rentabilidade  no período. Você deverá considerar o valor de abertura (*chart.result.indicators.quote.open*) [x]
6. Inclua um gráfico em linguagem nativa ou flutter apresentando o resultado da variação. [x]
7. Disponibilizar seu app junto com seu código aqui no Github [x]
