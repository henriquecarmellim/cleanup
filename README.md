# Windows Cleanup Utility

O **Windows Cleanup Utility** é um script Batch que facilita a manutenção e a otimização do seu sistema Windows. Ele fornece uma interface de menu simples para executar várias tarefas de limpeza e manutenção.

## Funcionalidades

O script inclui as seguintes opções:

1. **Limpar pastas Temp**: Remove arquivos temporários das pastas `%temp%` e `C:\Windows\Temp`.
2. **Limpar Prefetch**: Remove arquivos da pasta `C:\Windows\Prefetch`.
3. **Limpar Lixeira**: Limpa a Lixeira do Windows.
4. **Otimizar Sistema**: Limpa o cache DNS, ajusta o gerenciamento de energia e desativa serviços desnecessários.
5. **Reparar Arquivos do Sistema (SFC)**: Executa `sfc /scannow` para verificar e reparar arquivos do sistema corrompidos.
6. **Verificar e Reparar Erros no Disco (CHKDSK)**: Executa `chkdsk C: /f /r` para verificar e reparar erros no disco.
7. **Limpeza de Disco**: Executa o utilitário de limpeza de disco do Windows.
8. **Desfragmentar Disco**: Executa a desfragmentação do disco.
9. **Executar Todos**: Executa todas as tarefas de limpeza e manutenção.

## Instruções de Uso

1. **Executar o Script**:
   - Clique duas vezes no arquivo `.bat` para iniciar o script.
   - Se não estiver executando como administrador, será solicitada permissão para elevar os privilégios.

2. **Navegar pelo Menu**:
   - O menu exibido apresenta opções numeradas.
   - Digite o número da opção desejada e pressione `Enter`.

3. **Baixar o Executável Necessário**:
   - O script verifica e baixa automaticamente o arquivo `menumode.exe` se ele não estiver presente no diretório do script.

## Requisitos

- **Sistema Operacional**: Windows
- **Permissões**: O script deve ser executado com privilégios administrativos para realizar a limpeza e manutenção do sistema.

## Observações

- Certifique-se de salvar seu trabalho e fechar programas importantes antes de executar o script, especialmente se você optar por executar todas as tarefas.

## Suporte

Para quaisquer dúvidas ou problemas com o script, por favor, entre em contato com o desenvolvedor ou consulte a documentação adicional se disponível.

---

Este README fornece uma visão geral clara e concisa do que o script faz e como usá-lo. Se precisar de mais informações ou personalizações, é só avisar!
