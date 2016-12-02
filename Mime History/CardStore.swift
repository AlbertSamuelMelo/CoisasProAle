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
              "Na mitologia romana, os gêmeos foram jogados no rio Tibre, resgatados por uma loba, que os amamentou e posteriormente criados por um casal de pastores. Adultos, fundam a cidade Roma",
              "A Origem de Roma",
              #imageLiteral(resourceName: "romulo"),
              0
            ),
            ( 002,
              "Centurião",
              "",
              "O centurião era o soldado responsável por comandar a centúria, suas ordens eram prontamente obedecida pelos soldados. Os centuriões marchavam junto a sua centúria",
              "Comandante da Legião",
              #imageLiteral(resourceName: "centuriao"),
              0
            ),
            ( 003,
              "Salário",
              "",
              "Do latim, salarium, era uma porção de sal dada aos soldados romanos como pagamento pelos serviços prestados. Era uma iguaria rara e de fácil troca por comidas, roupas, armas, etc.  ",
              "Pagamento com Sal",
              #imageLiteral(resourceName: "salario"),
              0
            ),
            ( 004,
              "Tartaruga",
              "",
              "Uma formação de combate defensivo contra arquearia, permitindo avançar sob linhas inimigas sem abalo do ataque à distância. ",
              "Tática de Combate",
              #imageLiteral(resourceName: "tartaruga"),
              0
            ),
            (005,
             "Vênus",
             "",
             "Deusa do Amor e da Beleza. Os romanos se consideravam descendentes da deusa, por conta de seu filho Éneas, fundador mítico da raça romana e pai de Rômulo e Rêmulo.",
             "Deusa do Amor e Beleza",
             #imageLiteral(resourceName: "venus"),
             0
            ),
            (006,
             "Vinho",
             "",
             "Bebida alcoólica sempre esteve presente na cultura romana, acessível a todos. Era usado como forma de impor a cultura romana nas regiões conquistadas, que passavam a produzi-lo.",
             "Bebida Alcoólica de Uva",
             #imageLiteral(resourceName: "vinho"),
             0
            ),
            (007,
             "Senador",
             "",
             "Durante a Republica, os 300 Senadores, eleitos pelos Cônsules,  eram responsáveis pela elaboração de leis e decisões políticas. Seus membros eram em geral patrícios com cargos vitalícios",
             "Político Romano",
             #imageLiteral(resourceName: "senador"),
             0
            ),
            (008,
             "Netuno",
             "",
             "Deus dos Mares, Rios e Fontes. Filho do deus Saturno. Netuno tem o mar como sua morada, podendo criar terríveis tempestades ou ondas tranquilas, dependendo do seu humor",
             "Deus do Mar",
             #imageLiteral(resourceName: "netuno"),
             0
            ),
            (009,
             "Júlio César",
             "",
             "Caio Júlio César foi um militar e governante romano responsável pela conquista da Gália. Figura importante para o Império Romano. Foi assassinado, após uma conspiração do Senado Romano",
             "Imperador de Roma",
             #imageLiteral(resourceName: "julioCezar"),
             0
            ),
            (010,
             "Gladiador",
             "",
             "Os gladiadores eram lutadores de torneios no Coliseu. Eram escravos, treinados para combate. Por décadas, os Gladiadores lutaram entre si ou contra animais ferozes para entreter os romanos",
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
