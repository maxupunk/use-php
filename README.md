# php-use.bat

Este script `php-use.bat` é utilizado para gerenciar diferentes versões do PHP em um ambiente Windows. Ele permite listar as versões disponíveis, selecionar uma versão específica e atualizar o caminho do PHP no sistema.

## Como Funciona

### Configuração Inicial

- O script define o diretório base onde estão localizadas as versões do PHP (`PHP_DIR`).
- Verifica se o caminho `%PHP_DIR%\php-use` está no `PATH` do sistema. Se não estiver, ele adiciona.

### Listagem de Versões

- O script entra no diretório base (`%PHP_DIR%`) e verifica se a pasta `php-use` existe.
- Se a pasta `php-use` não existir, ele renomeia a primeira pasta encontrada que segue o padrão `php-*` para `php-use`.
- Lista todas as pastas que seguem o padrão `php-*` e exibe as versões disponíveis para o usuário.

### Seleção de Versão

- O usuário escolhe a versão desejada digitando o número correspondente.
- O script valida a escolha e obtém a pasta correspondente à versão selecionada.

### Atualização da Versão

- O script lê a versão atual do arquivo `snapshot.txt` na pasta `php-use`.
- Renomeia a pasta `php-use` para `php-"versão"`.
- Renomeia a pasta selecionada para `php-use`.
- Exibe uma mensagem de sucesso indicando que a pasta `php-use` foi atualizada para a versão selecionada.

## Como Instalar

### Baixe o Script

- Faça o download do arquivo `php-use.bat` e salve-o em um local de sua preferência.

### Configuração do Diretório PHP

- Certifique-se de que todas as versões do PHP estão localizadas no diretório `C:\laragon\bin\php` ou altere o script em `PHP_DIR=C:\laragon\bin\php`.
- Cada versão do PHP deve estar em uma pasta que segue o padrão `php-*` (por exemplo, `php-7.4.0`, `php-8.0.0`).

### Adicionar ao PATH

- Execute o script `php-use.bat` pela primeira vez para adicionar o caminho `%PHP_DIR%\php-use` ao `PATH` do sistema (nesse caso o terminal deverá estar rodando como administrador) ou você pode adicionar manualmente no PATH do Windows.

### Executar o Script

- Sempre que precisar trocar a versão do PHP, execute o script `php-use.bat`.
- Siga as instruções exibidas para selecionar a versão desejada.
- Em caso de ter adicionado o PATH, você pode usar o comando `php-use` em qualquer local no terminal.

## Exemplo de Uso

1. Abra o prompt de comando.
2. Navegue até o diretório onde o script `php-use.bat` está localizado.
3. Execute o script:
   ```sh
   php-use.bat

4. Siga as instruções para selecionar a versão do PHP desejada.

Pronto! A versão do PHP foi atualizada com sucesso. ```