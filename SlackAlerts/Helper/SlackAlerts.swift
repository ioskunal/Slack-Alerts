//
//  SlackAlerts.swift
//  SlackAlerts
//
//  Created by Kunal Gupta on 03/02/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

struct SlackAlerts {
    
    static private var slackWebhook = "SLACK_WEBHOOK_URL"

    internal static func postToSlack(_ message: String) {
        var arrFields = [JSON]()
        arrFields.append(getField("App Version", "1.0"))
        arrFields.append(getField("Build Number", "1"))
        let dictAttachment = ["title": message, "fields": arrFields] as [String : Any]
        var arrAttachments = [JSON]()
        arrAttachments.append(dictAttachment)
        APIManager.postToSlack(slackWebhook, arrAttachments)
    }
    
    private static func getField(_ title: String, _ message: String) -> JSON {
        var dict = JSON()
        dict["title"] = title
        dict["value"] = message
        dict["short"] = true
        return dict
    }

}
