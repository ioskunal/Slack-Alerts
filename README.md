# Slack-Alerts
A classic example of how to notify yourself on Slack in case of any failure of API.

![GitHub Logo](https://seeklogo.net/wp-content/uploads/2019/01/new-Slack-logo-vector.png)

## Context

We all have came up with a common problem multiple times where we get any error in our application and want to notify ourselves about it.

For example: The Server stops responding due to backend changes or breakdown and the user has no way to access the application till the time it is fixed by the backend team. But how are we going to get notified about it ? This is where **Slack Alerts** come into place. 

## Solution

Using this way we can notify ourselves and our team regarding any breakdown or warning in our system even if our servers are not working. Amazed huh?? How is that possible? Right? It is because we won't be using our servers to notify, we will be using Slack's service to do so.

## How To

### Step 1:

So to do this, you have should have
1. Slack account (Obviously) 
2. access to create an app on Slack for alerts. This bot will be responsible for sending you the notifications.

To create an app visit :point_right:  https://api.slack.com/apps 
Now we just need to create a Channel at Slack and then get the **SLACK_WEBHOOK_URL** which looks something like this: 

`https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX`

### Step 2:

Drag and drop **SlackAlerts.swift** and **APIManager.swift** file into your project and replace the `slackWebhook` with your incoming slack webhook url.

### Step 3:

Call ```postToSlack``` method to with `text` and `message`

This is what happens behind the scene: ```postToSlack``` method composes a dictionary and sends it to the slack, Slack redirects the call to your Slack Channel. 

![Slack Notification](https://i.imgur.com/lcwkAVL.jpg)


And thats it. 
You can configure the fields depending upon on your needs. Support for Image, Link, Emoji, Title and Value has been added.
Slack provides a bunch of other tools too. Check it here :point_right: https://api.slack.com/messaging/composing

