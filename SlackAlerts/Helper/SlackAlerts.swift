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

    internal static func postToSlack(_ text: String, _ message: String) {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""

        var dictAPI = JSON()
        var arrFields = [JSON]()
        var arrBlocks = [JSON]()
        let dictBlock = [
            "type" : "section",
            "text" : [
                "type" : "mrkdwn",
                "text": "<https://google.com|Google> \n :wink: \n Here is a perfect example of Image, Emoji and Clickable Link"
            ],
            "accessory": [
                "type" : "image",
                "image_url": "https://cdn4.wpbeginner.com/wp-content/uploads/2015/12/cc0-publicdomain.jpg", "alt_text": "Camera Click"
            ]
        ] as JSON
        arrBlocks.append(dictBlock)
        arrFields.append(getField(title: "App Version", message: appVersion, isShort: true))
        arrFields.append(getField(title: "Build Number", message: buildNumber, isShort: true))
        arrFields.append(getField(title: "Platform", message: "iOS", isShort: true))
        arrFields.append(getField(title: "Error Stack", message: "Data could not be read.", isShort: false))
        let dictAttachment = ["title": message, "fields": arrFields] as [String : Any]
        var arrAttachments = [JSON]()
        arrAttachments.append(dictAttachment)
        dictAPI = ["text": text, "attachments": arrAttachments, "blocks": arrBlocks]
        APIManager.postToSlack(slackWebhook, dictAPI)
    }
    
    private static func getField(title: String, message: String, isShort: Bool = true) -> JSON {
        var dict = JSON()
        dict["title"] = title
        dict["value"] = message
        dict["short"] = isShort
        return dict
    }

}
