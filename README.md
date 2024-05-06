# hear_fy

Esse projeto tem como objetivo realizar o consumo de algumas funcionalidades da Api disponibilizada pelo Spotify.

#Funcionalidades
- Busca das playlists publicas pelo ID de determinado usuário
- Listagem das músicas da playlist
- Reprodução das músicas(Deixei para tocar apenas as prévias de cada música)
- Alternar entre as músicas pelos botões de pular e voltar

Utilizei o Getx para o Gerenciamento de Estado, Rotas e Dependências
- https://pub.dev/packages/get
Para o consumo da Api em sí, utilizei o package Dio
- https://pub.dev/packages/dio


## Telas

![1](https://github.com/joaoteodoro16/hearfy/assets/78423868/a46e5c93-7724-44b3-9129-da14984f079b) ![2](https://github.com/joaoteodoro16/hearfy/assets/78423868/a5ee529c-d993-42f9-a282-8cbeaa0b5e9f)  ![3](https://github.com/joaoteodoro16/hearfy/assets/78423868/697bc9f1-c571-4c95-a3be-dd79a6f56f12)

Abaixo explico como Rodar o app na sua máquina corretamente

## Getting Started

Versão do Flutter utilizada: 3.16.5

Passo 1: Acessar o link de Desenvolvedor Spotify
https://developer.spotify.com/dashboard

Passo 2: Realizar a criação do App dentro do site do Spotify
![image](https://github.com/joaoteodoro16/hearfy/assets/78423868/737551eb-c1b1-49c2-9922-18d312e2c608)
![image](https://github.com/joaoteodoro16/hearfy/assets/78423868/e5091df1-0e95-45c2-a61f-521edd6c30b9)

Passo 3: Após a criação do App na plataforma, vai ser liberado um Client ID e um Client Secret que vão ser utilizados no consumo da Api
![Screenshot_1](https://github.com/joaoteodoro16/hearfy/assets/78423868/dfd775a8-d239-427b-bb05-d474e1ee4e43)

Passo 4: Dentro do projeto, localize na raiz, o arquivo chamado .env e insira as informações de acordo com oque se pede
![image](https://github.com/joaoteodoro16/hearfy/assets/78423868/11f5ebb4-a6d6-4fd4-8417-dd08c2dab194)

Passo 5: Já deixei o ID de um usuário aleatório no código do projeto, porém, se voce quiser alterar esse ID e colocar o seu perfil, basta pegar o link da sua conta e copiar essa parte do texto
![image](https://github.com/joaoteodoro16/hearfy/assets/78423868/16af8cbe-d9b5-4fe9-9765-c3cc6dfbc7db)

Para mais informações sobre a api para futuras implementações, segue o link da documentação oficial
- https://developer.spotify.com/documentation/web-api/tutorials/getting-started


