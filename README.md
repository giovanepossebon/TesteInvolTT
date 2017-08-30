# Teste Involves

### Considerações de desenvolvimento:

* Nas observações foi mencionado que o app poderia deslanchar e receber novas funções, por isso escolhi arquitetura VIPER, facilitando também a implementação dos testes. Foi por esse motivo que não usei MVVM e fiz apenas um xib.
* Também foi mencionado que a equipe poderia crescer, então optei pelo uso de XIBs substituindo Storyboards. Poderia facilitar em primeiro momento, visto que teriamos poucas telas, mas caso o projeto cresça e mais pessoas comecem a trabalhar nele, XIBs evitam conflitos de versão muito comuns em Storyboards. 
* Uso do inglês em nomes de classes, variáveis e metodos por padrão e porque foi mencionado que a equipe pode receber membros de outros países
* Uso do .gitignore para evitar problema de versionamento com outros desenvolvedores
* Poderia ter utilizado a lib do Twitter(TwitterKit) e finalizado o teste no mesmo dia, mas acredito que isso não sirva para medir o conhecimento, por esse motivo a única lib no Podfile é para facilitar no trabalho com OAuth.
* Não foi usado o login nativo do iOS pois o Social Framework será removido no iOS 11.


### Screenshots


### Como utilizar
Instale o cocoaPods:
```sh
# gem install cocoapods
```
Ou baixe o app em https://cocoapods.org/app
Instale as dependências:
```sh
$ pod setup 
$ pod install
```
Abra o projeto a partir do arquivo **InvolvesTT.xcworkspace**
Por fim, execute (cmd+R) em qualquer simulador ou dispositivo.

