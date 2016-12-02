//
//  DeckStore.swift
//  Mimica
//
//  Created by Albert Samuel Melo on 21/11/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class CardStore {

    static let singleton = CardStore()

    //Decks Packs
    //0 - Roma Antiga
    
    let dataCards:[
    (
        Int,    // 0 -> Id
        String, // 1 -> Titulo
        String, // 2 -> SubTitulo
        String, // 2 -> Descrição
        String, // 3 -> Era/Periodo
        UIImage,// 4 -> Ilustração
        Int     // 5 -> DeckPack
    )] =
    
        [
            
            ( 001,
              "Romulo & Remulo",
              "",
              "Segundo a mitologia romana, os gêmeos foram jogados no rio Tibre, na Itália. Resgatados por uma loba, que os amamentou, foram criados posteriormente por um casal de pastores. Adultos, retornam a cidade natal de Alba Longa e ganham terras para fundar uma nova cidade que seria Roma",
              "Monarquia Romana",
              UIImage(),
              0
            ),
            ( 002,
              "Monarquia Romana",
              "",
              "A sociedade, nesta época, era formada por patrícios, plebeus. O sistema político era a monarquia, onde o rei era escolhido pelos patrícios",
              "Monarquia Romana",
              UIImage(),
              0
            ),
            ( 003,
              "Republica Romana",
              "",
              "Após um grande choque entre o poder monárquico e a aristocracia patrícia, a qual se revoltou contra as vantagens que a monarquia vinha concedendo aos plebeus a fim de fortalecer seu poder e neutralizar o poder dos patrícios. Culminou na disposição do ultimo rei etrusco e o fim da monarquia. O poder executivo passou a ter uma nova organização administrativa",
              "Republica Romana",
              UIImage(),
              0
            ),
            ( 004,
              "Império Romano",
              "",
              "Após a conquista da Grecia, Egito, Macedônia, Gália, Germâni, Trácia, Síria e Palestina, a estrutura de Roma passou por significativas mudanças. O império romano passou a ser muito mais comercial do que agrário. Povos conquistados foram escravizados ou passaram a pagar impostos para o império. As províncias renderam grandes recursos para Roma. A capital do Império Romano enriqueceu e a vida dos romanos mudou.",
              "Império Romano",
              UIImage(),
              0
            ),
            (005,
             "Pão e Circo",
             "",
             "Com o grande crescimento urbano, surgiram vários problemas sociais. A escravidão gerou desemprego na zona rural. Com a perda de seus empregos muitos camponeses migraram para as cidades em busca de boas condições de vida. Para evitar possíveis revoltas o imperador criou a política do pão e circo, onde se oferecia alimentação e diversão para o povo.",
             "Império Romano",
             UIImage(),
             0
            ),
            (006,
             "Coliseu",
             "",
             "O Coliseu de Roma foi construído sobre o lago da casa de Nero, a tão famosa Domus Áurea ficou conhecido como Colosseo (Coliseu) pois ali foi achada a estátua gigante (colosso) do imperador. No coliseu gladiadores lutavam e cristãos eram lançados aos leões.",
             "Império Romano",
             UIImage(),
             0
            ),
            (007,
             "Cônsules",
             "",
             "Durante a Republica, os dois Cônsules eram responsáveis pelo poder executivo, alem de serem os comandantes do exercito",
             "Republica Romana",
             UIImage(),
             0
            ),
            (007,
             "Senadores",
             "",
             "Durante a Republica, os 300 Senadores eram responsáveis pela eraboracao de leis e pelas decisões políticas. Seus membros eram em geral patrícios com cargos vitalícios. Eles eram eleitos pelos Cônsules",
             "Republica Romana",
             UIImage(),
             0
            ),
            (008,
             "Pretores",
             "",
             "Os pretores eram responsáveis por questões jurídicas. Estes eram divididos em dois grupos, os pretores urbanos, que eram responsáveis pela justiça na cidade, e os pretores peregrinos, que tratavam da justiça rural e dos estrangeiros",
             "Republica Romana",
             UIImage(),
             0
            ),
            (010,
             "Questores",
             "",
             "Os Questores eram como tesoureiros de Roma, Cuidavam das financias do templo e eram consultados pelos cônsules na administração das verbas públicas assim como na verba gasta em campanhas militares",
             "Republica Romana",
             UIImage(),
             0
            ),
            (011,
             "Edis",
             "",
             "O edis tinham varias funções desde a preservação da cidade de Roma ao policiamento da população",
             "Republica Romana",
             UIImage(),
             0
            ),
            (012,
             "Censores",
             "",
             "Os Censores estavam responsáveis pelo censo da população e a sua classificação de acordo com seu nível de renda. Além de conduzir trabalhos públicos e vigiar os cidadãos romanos.",
             "Republica Romana",
             UIImage(),
             0
            ),
            (013,
             "Assembleia Curial",
             "",
             "A Assembleia Curial era uma das três grandes assembleias. Está estava responsável pelos assuntos religiosos",
             "Republica Romana",
             UIImage(),
             0
            ),
            (014,
             "Assembleia Tribal",
             "",
             "A Assembleia Tribal era uma das três grandes assembleias.  Está estava responsável pela eleição das magistraturas inferiores, classificando os cidadãos de acordo com sua tribo de origem.",
             "Republica Romana",
             UIImage(),
             0
            ),
            (015,
             "Assembleia Centurial",
             "",
             "A Assembleia Centurial, a mais importante das 3 assembleias, mostrava a importância e o poder que os militares deitam em Roma. Esta estava responsável pela votação de projetos apresentados, e era composta por Centúrias de origem patrícia e da plebe.",
             "Republica Romana",
             UIImage(),
             0
            ),
            (016,
             "Guerras Púnicas",
             "",
             "Apos o grande avanço das forças militares romanas o Império entrou em choque com Cartago e Macedônia, potências que nessa época dominavam o Mediterrâneo. As rivalidades entre os cartagineses e os romanos resultaram nas Guerras Púnicas, que recebeu esse nome como referencia a “puni” nome pelo qual os habitantes de Cartago eram conhecidos.",
             "Republica Romana",
             UIImage(),
             0
            ),
            (017,
             "Júlio César",
             "",
             "Caio Júlio César (nome real de Gaius Julius Caesar) foi um militar e governante romano. Foi o responsável pela conquista da Gália. Teve um papel de suma importância para a passagem da República para o Império Romano. Foi assassinado, após uma conspiração do Senado Romano",
             "Republica Romana",
             UIImage(),
             0
            ),
            (018,
             "Otavio Augustos",
             "",
             "O primeiro Impérador Romano. Herdeiro de Júlio César, teve que lutar para receber sua herança. Seu reinado é considerado um dos mais prósperos do Império Romano, tanto no tocante ao desenvolvimento econômico quanto ao cultural",
             "Império Romano",
             UIImage(),
             0
            ),
            (019,
             "Gladiadores",
             "",
             "Os gladiadores eram lutadores que participavam de torneios de luta no Coliseu. Estes eram escravos, treinados para combate. Por muitos séculos, os Gladiadores lutaram entre si ou contra animais ferozes para entreter os romanos",
             "Império Romano",
             UIImage(),
             0
            ),
            (020,
             "Centurião",
             "",
             "O centurião era o soldado responsável por comandar a centúria, suas ordens eram prontamente obedecida pelos soldados. Os centuriões marchavam junto a sua centúria",
             "Império Romano",
             UIImage(),
             0
            ),
        ]

    
    func getDeck()-> [Card] {
        
        var cards = [Card]()
        
        for dataCard in dataCards {
            
            let card = Card()
            
            card.Id = dataCard.0
            card.Titulo = dataCard.1
            card.SubTitulo = dataCard.2
            card.Descricao = dataCard.3
            card.Era = dataCard.4
            card.Ilustracao = dataCard.5
            card.Deck = dataCard.6
            
            cards.append(card)
        }
        
        return cards
        
    }

    
}
