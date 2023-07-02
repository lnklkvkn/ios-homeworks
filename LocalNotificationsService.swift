//
//  LocalNotificationsService.swift
//  Navigation
//
//  Created by ln on 02.07.2023.
//

import UIKit
import UserNotifications

final class LocalNotificationsService {
    
    func registeForLatestUpdatesIfPossible() {
        print("Начало сработало")
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.provisional, .badge, .sound]) { success, error in
            if success {
                print("Уведомления зарегистрированы")
                self.scheduleNotification()
            } else {
                print(error?.localizedDescription as Any)
            }
            
        }
    }
    
    func scheduleNotification() {
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Посмотрите последние обновления"
        content.body = "Посмотрите последние обновления"
        content.badge = 1
        content.sound = .default

        var triggerTime = DateComponents()
        triggerTime.hour = 19
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        center.add(request)
    }
}


