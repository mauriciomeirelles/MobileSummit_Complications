//
//  ComplicationController.swift
//  WatchApp Extension
//
//  Created by Mauricio Meirelles on 9/26/15.
//  Copyright © 2015 Meirelles and Zaquia. All rights reserved.
//

import ClockKit
import WatchKit

class ComplicationController: NSObject, CLKComplicationDataSource {

    let mobileSummitColor = UIColor(red:0.24, green:0.22, blue:0.94, alpha:1)


    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate())
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let ext = WKExtension.sharedExtension().delegate as! ExtensionDelegate

        handler(NSDate().dateByAddingTimeInterval(Double(60*60*ext.palestrasMobileSummit.count-1)))
    }

    func createTemplateForComplication(complication:CLKComplication, palestra:(text:String,imageType:String,time:NSDate ), percent:Float) -> CLKComplicationTimelineEntry {

        var template: CLKComplicationTemplate? = nil

        switch complication.family {
        case .ModularSmall:
            let modularTemplate = CLKComplicationTemplateModularSmallRingImage()
            modularTemplate.tintColor = mobileSummitColor
            let img = UIImage(named: "Complication/Modular")
            modularTemplate.imageProvider = CLKImageProvider(onePieceImage: img!)
            modularTemplate.fillFraction = percent
            modularTemplate.ringStyle = CLKComplicationRingStyle.Closed
            template = modularTemplate
        case .ModularLarge:
            let modularTemplate = CLKComplicationTemplateModularLargeStandardBody()
            modularTemplate.tintColor = mobileSummitColor
            modularTemplate.headerImageProvider = CLKImageProvider(onePieceImage: UIImage(named:palestra.imageType)!)
            modularTemplate.headerTextProvider = CLKSimpleTextProvider(text: "Mobile Summit")
            modularTemplate.body1TextProvider = CLKSimpleTextProvider(text: palestra.text)
            template = modularTemplate
        default:
            template = nil
        }
        let timelineEntry = CLKComplicationTimelineEntry(date: palestra.time, complicationTemplate: template!)

        return timelineEntry
    }

    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        let ext = WKExtension.sharedExtension().delegate as! ExtensionDelegate
        let timelineEntry = createTemplateForComplication(complication,palestra:ext.palestrasMobileSummit[0], percent:0.1)

        handler(timelineEntry)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        let ext = WKExtension.sharedExtension().delegate as! ExtensionDelegate


        var timelineEntriesArray:[CLKComplicationTimelineEntry] = []

        for(var idx = 1; idx < ext.palestrasMobileSummit.count; idx++) {

            let timelineEntry = createTemplateForComplication(complication,palestra:ext.palestrasMobileSummit[idx], percent:Float(idx+1)/Float(ext.palestrasMobileSummit.count))

            timelineEntriesArray.append(timelineEntry)

        }
        
        handler(timelineEntriesArray)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(nil);
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached

        var template: CLKComplicationTemplate? = nil


        switch complication.family {
            case .ModularSmall:
                let modularTemplate = CLKComplicationTemplateModularSmallRingImage()
                modularTemplate.tintColor = mobileSummitColor
                let img = UIImage(named: "Complication/Modular")
                modularTemplate.imageProvider = CLKImageProvider(onePieceImage: img!)
                modularTemplate.fillFraction = 0.7
                modularTemplate.ringStyle = CLKComplicationRingStyle.Closed
                template = modularTemplate
            case .ModularLarge:
                let modularTemplate = CLKComplicationTemplateModularLargeStandardBody()
                modularTemplate.tintColor = mobileSummitColor
                modularTemplate.headerImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "globe")!)
                modularTemplate.headerTextProvider = CLKSimpleTextProvider(text: "Mobile Summit")
                modularTemplate.body1TextProvider = CLKSimpleTextProvider(text: "Informações do evento")
                template = modularTemplate
            default:
                template = nil



        }



        handler(template)
    }
    
}
