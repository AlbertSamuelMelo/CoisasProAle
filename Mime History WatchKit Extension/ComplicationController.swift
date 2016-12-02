//
//  ComplicationController.swift
//  Mime History WatchKit Extension
//
//  Created by Anderson Oliveira on 01/12/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import ClockKit
import WatchConnectivity


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
//    var session: WCSession?{
//        didSet{
//            if let session = session{
//                session.delegate = self
//                session.activate()
//            }
//        }
//    }
    
    var equip = ""
    
    let timeLineText = ["Grab some Breakfast", "Drive to Work", "Meet with Boss", "Get a big Raise!"]
    
    //let equipes = ["Legionários","Beserkers","Espartanos","Cruzados"]
    var vencedor = String()
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        
        let currentDate = Date()
        
        handler(currentDate)
        
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        
        let currentDate = Date()
        let endDate = currentDate.addingTimeInterval(4 * 60 * 60)
        
        handler(endDate)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        
        // let timeString = dateFormatter.string(from: Date())
        var entry: CLKComplicationTimelineEntry?
        if vencedor == ""{
            entry = createTimeEntry(headerText: equip, bodyText: timeLineText[0], date: Date())
        }else{
            entry = createTimeEntry(headerText: vencedor, bodyText: timeLineText[0], date: Date())
        }
        
        handler(entry)
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        
        
        print("AUAUAUAUAUAUAUAUAUAUAU: \(equip)")
        
        var timeLineEntryArray = [CLKComplicationTimelineEntry]()
        var nextDate = Date(timeIntervalSinceNow: 1 * 60 * 60)
        
        for index in 1...3 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            
            //  let timeString = dateFormatter.string(from: nextDate)
            var entry: CLKComplicationTimelineEntry?
            if vencedor == ""{
                entry = createTimeEntry(headerText: "TTT", bodyText: timeLineText[index], date: nextDate)
            }else{
                entry = createTimeEntry(headerText: vencedor, bodyText: timeLineText[index], date: nextDate)
            }
            
            timeLineEntryArray.append(entry!)
            
            nextDate = nextDate.addingTimeInterval(1 * 60 * 60)
        }
        
        
        handler(timeLineEntryArray)
        
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void){
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        handler(nil)
    }
    
    //MARK: - Função Teste
    
    func createTimeEntry(headerText: String, bodyText: String, date: Date) -> CLKComplicationTimelineEntry {
        let template = CLKComplicationTemplateModularLargeStandardBody()
        template.headerTextProvider = CLKSimpleTextProvider(text: headerText)
        template.body1TextProvider = CLKSimpleTextProvider(text: bodyText)
        
        let entry = CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
        
        return entry
    }
    
}
extension ComplicationController: WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("watchOP: Session Ativado.")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("Recive iOS mensager")
        
        if message["comando"] as? String == "Legionários"{
            
            equip = "Legionários"
            
            //_ = ComplicationController().vencedor = "Legionários"
            
            print("Chegou a equipe Legionarios")
            let response = ["Time":"Legionários"]
            replyHandler(response)
        }else if message["comando"] as? String == "Beserkers"{
            
            equip = "Beserkers"
            
            // _ = ComplicationController().vencedor = "Beserkers"
            
            print("Chegou a equipe Beserkers")
            let response = ["Time":"Beserkers"]
            replyHandler(response)
        }else if message["comando"] as? String == "Espartanos"{
            
            equip = "Espartanos"
            
            
            //  _ = ComplicationController().vencedor = "Espartanos"
            print("Chegou a equipe Espartanos")
            let response = ["Time":"Espartanos"]
            replyHandler(response)
        }else if message["comando"] as? String == "Cruzados"{
            
            equip = "Cruzados"
            
            //   _ = ComplicationController().vencedor = "Cruzados"
            
            print("Chegou a equipe Cruzados")
            let response = ["Time":"Cruzados"]
            replyHandler(response)
        
        }
    
    }
}
