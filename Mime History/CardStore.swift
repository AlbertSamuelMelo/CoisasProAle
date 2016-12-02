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
              "Rômulo & Rêmulo",
              "",
              "Segundo a mitologia romana, os gêmeos foram jogados no rio Tibre, na Itália. Resgatados por uma loba, que os amamentou, foram criados posteriormente por um casal de pastores. Adultos, retornam a cidade natal de Alba Longa e ganham terras para fundar uma nova cidade que seria Roma",
              "A Origem de Roma",
              #imageLiteral(resourceName: "romulo"),
              0
            ),
            ( 002,
              "Centurião",
              "",
              "A sociedade, nesta época, era formada por patrícios, plebeus. O sistema político era a monarquia, onde o rei era escolhido pelos patrícios",
              "Comandante da Legião",
              #imageLiteral(resourceName: "centuriao"),
              0
            ),
            ( 003,
              "Salário",
              "",
              "Após um grande choque entre o poder monárquico e a aristocracia patrícia, a qual se revoltou contra as vantagens que a monarquia vinha concedendo aos plebeus a fim de fortalecer seu poder e neutralizar o poder dos patrícios. Culminou na disposição do ultimo rei etrusco e o fim da monarquia. O poder executivo passou a ter uma nova organização administrativa",
              "Pagamento com Sal",
              #imageLiteral(resourceName: "salario"),
              0
            ),
            ( 004,
              "Tartaruga",
              "",
              "Após a conquista da Grecia, Egito, Macedônia, Gália, Germâni, Trácia, Síria e Palestina, a estrutura de Roma passou por significativas mudanças. O império romano passou a ser muito mais comercial do que agrário. Povos conquistados foram escravizados ou passaram a pagar impostos para o império. As províncias renderam grandes recursos para Roma. A capital do Império Romano enriqueceu e a vida dos romanos mudou.",
              "Tática de Combate",
              #imageLiteral(resourceName: "tartaruga"),
              0
            ),
            (005,
             "Vênus",
             "",
             "Com o grande crescimento urbano, surgiram vários problemas sociais. A escravidão gerou desemprego na zona rural. Com a perda de seus empregos muitos camponeses migraram para as cidades em busca de boas condições de vida. Para evitar possíveis revoltas o imperador criou a política do pão e circo, onde se oferecia alimentação e diversão para o povo.",
             "Deusa do Amor e Beleza",
             #imageLiteral(resourceName: "venus"),
             0
            ),
            (006,
             "Vinho",
             "",
             "O Coliseu de Roma foi construído sobre o lago da casa de Nero, a tão famosa Domus Áurea ficou conhecido como Colosseo (Coliseu) pois ali foi achada a estátua gigante (colosso) do imperador. No coliseu gladiadores lutavam e cristãos eram lançados aos leões.",
             "Bebida Alcoólica de Uva",
             #imageLiteral(resourceName: "vinho"),
             0
            ),
            (007,
             "Cônsules",
             "",
             "Durante a Republica, os dois Cônsules eram responsáveis pelo poder executivo, alem de serem os comandantes do exercito",
             "Político Romano",
             #imageLiteral(resourceName: "senador"),
             0
            ),
            (008,
             "Netuno",
             "",
             "Apos o grande avanço das forças militares romanas o Império entrou em choque com Cartago e Macedônia, potências que nessa época dominavam o Mediterrâneo. As rivalidades entre os cartagineses e os romanos resultaram nas Guerras Púnicas, que recebeu esse nome como referencia a “puni” nome pelo qual os habitantes de Cartago eram conhecidos.",
             "Deus do Mar",
             #imageLiteral(resourceName: "netuno"),
             0
            ),
            (009,
             "Júlio César",
             "",
             "Caio Júlio César (nome real de Gaius Julius Caesar) foi um militar e governante romano. Foi o responsável pela conquista da Gália. Teve um papel de suma importância para a passagem da República para o Império Romano. Foi assassinado, após uma conspiração do Senado Romano",
             "Imperador de Roma",
             #imageLiteral(resourceName: "julioCezar"),
             0
            ),
            (010,
             "Gladiador",
             "",
             "Os gladiadores eram lutadores que participavam de torneios de luta no Coliseu. Estes eram escravos, treinados para combate. Por muitos séculos, os Gladiadores lutaram entre si ou contra animais ferozes para entreter os romanos",
             "Guerreiro Escravo",
             #imageLiteral(resourceName: "gladiador"),
             0
            )
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
