# Archive Postmark Messages

⚠️ In Testing and Demo!

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

# Query Method

* Go to rails console
```
  # Aug 2017
  => @from_date = Date.today.last_month.beginning_of_month.strftime("%Y-%m-%d")
  => @to_date = Date.today.last_month.end_of_month.strftime("%Y-%m-%d")

  # Sept 2017
  => @from_date = Date.beginning_of_month.strftime("%Y-%m-%d")
  => @to_date = Date.end_of_month.strftime("%Y-%m-%d")
```

* Get Outbound messages search
  * Required headers
    * Accept
    * X-Postmark-Server-Token
  * Required parameters
    * count
    * offset

  <!-- Outbound -->
  ```
  messages = `curl "https://api.postmarkapp.com/messages/outbound?count=500&offset=0&todate=#{@to_date}&fromdate=#{@from_date}" -X GET -H "Accept: application/json" -H "X-Postmark-Server-Token: #{ENV["POSTMARK_API_KEY"]}"`
  ```

  <!-- Inbound -->
  ```
  messages = `curl "https://api.postmarkapp.com/messages/inbound?count=500&offset=0&fromdate=#{@from_date}&todate=#{@to_date}" -X GET -H "Accept: application/json" -H "X-Postmark-Server-Token: #{ENV["POSTMARK_API_KEY"]}"`
  ```

* Parse json data
  ```
  data = JSON.parse(messages)
  ```
* We have `data` string values which we will map the
  * TotalCount
  * Messages
    * Tag
    * MessageID
    * To [Email, Name]
    * Cc [Email, Name]
    * Bcc [Email, Name]
    * Recipients
    * ReceivedAt
    * From
    * Subject
    * Attachments
    * Status
    * TrackOpens
    * TrackLinks

* Save it to CSV ...
  * TotalCount
    ```
    puts data["TotalCount"]
    ```
  * Messages
    ```
      count = 0
      data["Messages"].each do |d|
        count += 1
        puts "#{count}) #{d["Tag"]} #{d["MessageID"]} #{d["To"]} #{d["Cc"]} #{d["Bcc"]} #{d["Recipients"]} #{d["ReceivedAt"]} #{d["ReceivedAt"]} #{d["From"]} #{d["Subject"]} #{d["Attachments"]} #{d["Status"]} #{d["TrackOpens"]} #{d["TrackLinks"]}"
      end
    ```

On going! ...

## Testing the inbound webhook with curl (Sample)
  ```
  curl <your-url> \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{ "FromName": "Postmarkapp Support", "From": "support@postmarkapp.com", "FromFull": { "Email": "support@postmarkapp.com", "Name": "Postmarkapp Support", "MailboxHash": "" }, "To": "\"Firstname Lastname\" <yourhash+SampleHash@inbound.postmarkapp.com>", "ToFull": [ { "Email": "yourhash+SampleHash@inbound.postmarkapp.com", "Name": "Firstname Lastname", "MailboxHash": "SampleHash" } ], "Cc": "\"First Cc\" <firstcc@postmarkapp.com>, secondCc@postmarkapp.com", "CcFull": [ { "Email": "firstcc@postmarkapp.com", "Name": "First Cc", "MailboxHash": "" }, { "Email": "secondCc@postmarkapp.com", "Name": "", "MailboxHash": "" } ], "Bcc": "\"First Bcc\" <firstbcc@postmarkapp.com>, secondbcc@postmarkapp.com", "BccFull": [ { "Email": "firstbcc@postmarkapp.com", "Name": "First Bcc", "MailboxHash": "" }, { "Email": "secondbcc@postmarkapp.com", "Name": "", "MailboxHash": "" } ], "Subject": "Test subject", "MessageID": "73e6d360-66eb-11e1-8e72-a8904824019b", "ReplyTo": "replyto@postmarkapp.com", "MailboxHash": "SampleHash", "Date": "Fri, 1 Aug 2014 16:45:32 -04:00", "TextBody": "This is a test text body.", "HtmlBody": "<html><body><p>This is a test html body.<\/p><\/body><\/html>", "StrippedTextReply": "This is the reply text", "Tag": "TestTag", "Headers": [ { "Name": "X-Header-Test", "Value": "" }, { "Name": "X-Spam-Status", "Value": "No" }, { "Name": "X-Spam-Score", "Value": "-0.1" }, { "Name": "X-Spam-Tests", "Value": "DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_PASS" } ], "Attachments": [ { "Name": "test.txt", "Content": "VGhpcyBpcyBhdHRhY2htZW50IGNvbnRlbnRzLCBiYXNlLTY0IGVuY29kZWQu", "ContentType": "text/plain", "ContentLength": 45 } ] }'
  ```
