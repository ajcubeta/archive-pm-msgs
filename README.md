# Archive Postmark Messages Test

⚠️ For Testing and Demo!

# Objective

Copy Postmark messages that has open tracking enabled and store it on CSV file format for archive.

# Motivation

Postmark account has the capability to identify activities within its server such as:

* Number of emails that the server have sent in the last 30days
* Percentage rating for the Bounced emails
* Out of certain number of emails sent out with open tracking, a particular percentage of emails were opened.
* How long did the viewer read the email in seconds
* What platforms used by the recipients
* Email clients that the recipients used to open the emails

But Postmark will eventually remove email records within the next 45 days after it has been recorded in Postmark server account.

So we would like to have a copy of our own for data recording purpose and have it archive in order to handle future analysis.

# Messages API

Postmark has [Messages API](http://developer.postmarkapp.com/developer-api-messages.html) that let us get all the details about any outbound or inbound message that we've sent or received through a specific server.

# Console

* Go to rails console
* Get Messages
```
messages =
`curl "https://api.postmarkapp.com/messages/outbound?recipient={recipient_email}&count=500&offset=0&todate={todate}&fromdate={fromdate}" -X GET -H "Accept: application/json" -H "X-Postmark-Server-Token: ENV["POSTMARK_API_KEY"]"`
```
* Parse json data
```
 datas = JSON.parse(messages)
```
* We have `data` string values which we will map the
  * Tag
  * MessageID
  * To [Email, Name]
  * Cc [Email, Name]
  * Bccs [Email, Name]
  * Recipients
  * ReceivedAt
  * From
  * Subject
  * Attachments
  * Status
  * TrackOpens
  * TrackLinks

* Save it to CSV ...

On going! ...
