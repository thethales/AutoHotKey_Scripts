import sys


from builtins import print


def main():
    shortcuts = [
        ['!','SHIFT'],
        ['^','CTRL'],
        ['+','ALT']
    ]

    f = open('th_hotkeys.ahk', 'r')
    x = f.readlines()
    c = ''
    for i in range(len(x)):
        if (isDescricaoTarefa(x[i])) :
            c += x[i] + '\n'
            if not (isLinhaSeparadora(x[i+1])):
                c += '  -> ' +  x[i+1].replace(';','')
                c += '\n'
                c += '  -> Descrição do Atalho: ' + x[i + 1].replace(';', '')
    criarReadMe(c)
            #print(x[i])
            #print(x[i+1])




def isDescricaoTarefa(line):
    if (line[:2]  == ";#") :
        return True
    else:
        return False
    return;

def isLinhaSeparadora(line):
    if (line[2:2]  == "=") or ( line[2:2] == "-"):
        return True
    else:
        return False
    return;


def criarReadMe(conteudo):

    cabecalho = '# AutoHotKey_Scripts' + '\n' + 'A collection of AutoHotKey scripts' '\n' \
                + 'Uma coleção de Scripts AutoHotKey' \
                + '\n\nDocumentação para o Arquivo:  th_hotkeys.ahk'

    separador = '\n/*---------------------------------------------------------------*/\n'
    f = open("README.MD", "w+")
    f.write(cabecalho)

    f.write(separador)
    f.write(conteudo)
    f.close()
    return;


if __name__ == '__main__':
    sys.exit(main())