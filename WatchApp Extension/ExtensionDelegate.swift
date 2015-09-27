//
//  ExtensionDelegate.swift
//  WatchApp Extension
//
//  Created by Mauricio Meirelles on 9/26/15.
//  Copyright © 2015 Meirelles and Zaquia. All rights reserved.
//

import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    var palestrasMobileSummit:[(text:String, imageType:String, time:NSDate)] = []


    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.

        palestrasMobileSummit.append((text:"Apple Watch: Descomplicando os Complications", imageType:"phone", time:NSDate()))
        palestrasMobileSummit.append((text:"Almoço", imageType:"globe", time:NSDate().dateByAddingTimeInterval(60*50)))
        palestrasMobileSummit.append((text:"Quando sair da zona de conforto? AGORA!", imageType:"globe", time:NSDate().dateByAddingTimeInterval(2*(60*60) + (60*20))))
        palestrasMobileSummit.append((text:"Desmestificando UX", imageType:"desktop", time:NSDate().dateByAddingTimeInterval(2*(60*60) + (60*50))))
        palestrasMobileSummit.append((text:"Write the code and run a app!", imageType:"phone", time:NSDate().dateByAddingTimeInterval(2*(60*60) + (60*90))))
        palestrasMobileSummit.append((text:"Digits: identificando seus usuários de maneira mais eficiente", imageType:"phone", time:NSDate().dateByAddingTimeInterval(2*(60*60) + (60*130))))
        palestrasMobileSummit.append((text:"Coffee break", imageType:"globe", time:NSDate().dateByAddingTimeInterval(2*(60*60) + (60*170))))
        palestrasMobileSummit.append((text:"Desenvolvedor mobile precisa aprender Web", imageType:"desktop", time:NSDate().dateByAddingTimeInterval(2*(60*60) + (60*210))))
        palestrasMobileSummit.append((text:"Debate", imageType:"globe", time:NSDate().dateByAddingTimeInterval(2*(60*60) + (60*250))))
        palestrasMobileSummit.append((text:"Encerramento e sorteios", imageType:"globe", time:NSDate().dateByAddingTimeInterval(2*(60*60) + (60*290))))

    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}
