#################################################
#   Repair-Search - iOS Project                	#
##  Author: @Renatdz                            #
#################################################

## Primeiros passos
Se você acabou de baixar o projeto, não se esqueça de executar o seguinte comando no terminal.
(Lembre-se também de estar no mesmo diretório do projeto)

### Instalando dependências
```
pod install
```

### Observações
Se você se deparar com um crash parecido com este:

```
Terminating app due to uncaught exception 'GMSException', reason: 'Google Maps SDK for iOS requires GoogleMaps.bundle to be part of your target under 'Copy Bundle Resources''
```

Esse erro acontece algumas raras vezes quando já se tem uma pasta /Pods no projeto e você roda o 'pod install' novamente. Isso faz com que o XCode perca a referência do arquivo 'GoogleMaps.bundle'.

Para solucionar esse erro não tem algo que eu possa fazer para que cubra qualquer dev que possa instalar o projeto, então peço encarecidamente que ao se deparar com esse erro faça os seguintes passos:

```
pod deintegrate

pod install
```

Referência: https://github.com/CocoaPods/cocoapods-deintegrate
