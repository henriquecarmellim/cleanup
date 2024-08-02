# Windows Cleanup Utility

Este script batch oferece uma maneira conveniente de realizar várias tarefas de limpeza e otimização no Windows. Ele inclui um menu que permite ao usuário escolher entre várias opções para melhorar o desempenho do PC, limpar arquivos desnecessários e reparar arquivos do sistema.

## Funcionalidades

1. **Clean Temp folders**: Limpa os arquivos temporários nas pastas `%temp%`, `C:\Windows\Temp` e `%userprofile%\AppData\Local\Temp`.
2. **Clean Prefetch**: Limpa os arquivos na pasta `C:\Windows\Prefetch`.
3. **Clean Recycle Bin**: Esvazia a Lixeira.
4. **Optimize System**: Otimiza o sistema (comandos específicos podem ser adicionados conforme necessário).
5. **Repair System Files (SFC)**: Executa o comando `sfc /scannow` para verificar e reparar arquivos de sistema corrompidos.
6. **Check and Repair Disk Errors (CHKDSK)**: Executa o comando `chkdsk /f /r` para verificar e reparar erros no disco.
7. **Disk Cleanup**: Executa a Limpeza de Disco utilizando `cleanmgr /sageset:1` e `cleanmgr /sagerun:1`.
8. **Defragment Disk**: Desfragmenta o disco utilizando `defrag C: /O`.
9. **Run All**: Executa todas as tarefas acima em sequência.

## Uso

1. **Baixar o script**:
   - Salve o script em um arquivo chamado `cleanup.bat`.

2. **Executar o script**:
   - Clique com o botão direito do mouse no arquivo `cleanup.bat` e selecione "Executar como administrador".

3. **Selecione uma opção**:
   - Escolha a opção desejada no menu digitando o número correspondente e pressionando `Enter`.

