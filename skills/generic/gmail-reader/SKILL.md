---
name: gmail-reader
description: >
  Reads, searches, and summarizes Gmail messages and threads using the Gmail API (read-only).
  Use when the user says "check my email", "find emails from", "show unread messages",
  "read the email about", "search my inbox for", "what did John send me",
  "any new emails today", "open that email thread", "who emailed me about",
  or wants to find emails by sender, subject, or keyword, read a thread, list unread messages, or summarize an inbox.
---

# Gmail Reader

## Quick Start
Search and retrieve Gmail messages via the Gmail API using `users.messages.list` and `users.messages.get`. Parse message headers and body, then present a clean readable summary. Requires `https://www.googleapis.com/auth/gmail.readonly` scope.

## Setup — Get Gmail Access Token

If the user hasn't provided an access token yet, guide them through these steps:

1. Go to **Google OAuth Playground**: https://developers.google.com/oauthplayground
2. In the left panel, find and select scope: `https://www.googleapis.com/auth/gmail.readonly`
3. Click **Authorize APIs** → sign in with the Gmail account to read
4. Click **Exchange authorization code for tokens**
5. Copy the **Access token** and paste it back here

> **Note:** The access token expires after ~1 hour. If you get a `401 Unauthorized` error, repeat the steps above to get a fresh token.

## Workflow
1. Determine the request type: search, read thread, list unread, or summarize inbox
2. Build the query string using Gmail search operators (from:, to:, subject:, is:unread, after:, before:, has:attachment, label:)
3. Call `GET /gmail/v1/users/me/messages?q=<query>` to get matching message IDs
4. Fetch full message details via `GET /gmail/v1/users/me/messages/<id>?format=full`
5. Decode the message body (base64url) and extract headers: From, To, Subject, Date
6. Present formatted results — summary for lists, full content for single message reads

## Examples

**Example 1: Search emails from a sender**
Input: "Show me emails from john@example.com this week"
Output:
```
GMAIL SEARCH RESULTS
=====================
Query:   from:john@example.com after:2026/03/17
Found:   3 messages

1. Subject: Q1 Report Review
   From:    john@example.com
   Date:    03/24/2026 09:12 AM
   Snippet: Hi, please find the Q1 report attached for your review...

2. Subject: Re: Budget Meeting Follow-up
   From:    john@example.com
   Date:    03/22/2026 02:45 PM
   Snippet: Thanks for the notes. I've updated the spreadsheet...

3. Subject: Team Lunch Next Friday
   From:    john@example.com
   Date:    03/18/2026 11:30 AM
   Snippet: Hey everyone, booking the usual spot for next Friday...
```

**Example 2: List unread emails**
Input: "What are my unread emails?"
Output:
```
UNREAD MESSAGES (5)
====================
1. [03/24 09:45] Sarah Johnson — Re: Project Kickoff Agenda
2. [03/24 08:30] noreply@github.com — [PR #142] New review requested
3. [03/23 06:15 PM] billing@aws.com — Your AWS invoice for March 2026
4. [03/23 04:00 PM] boss@company.com — Quick question about the timeline
5. [03/22 11:00 AM] hr@company.com — Benefits enrollment reminder

Reply "read #N" to see the full content of any message.
```

**Example 3: Read a full thread**
Input: "Read the email thread about the Q1 report"
Output:
```
THREAD: Q1 Report Review (3 messages)
=======================================
--- Message 1 of 3 ---
From:    john@example.com
To:      me@company.com
Date:    03/24/2026 09:12 AM
Subject: Q1 Report Review

Hi,

Please find the Q1 report attached for your review. Key highlights:
- Revenue up 12% vs Q4
- Expenses on target
- Headcount at 42 FTEs

Let me know if you have questions.

John

--- Message 2 of 3 ---
From:    me@company.com
To:      john@example.com
Date:    03/24/2026 10:05 AM

Looks great, thanks! I have one question about the expense line...
[continues]
```

## Tools
- Use `WebFetch` to call Gmail API endpoints with the user's OAuth access token
- Use `Bash` with curl as fallback for API calls

## Error Handling
- If no OAuth token provided → explain the user must authenticate with `gmail.readonly` scope first
- If `401 Unauthorized` → token expired; ask user to re-authenticate
- If `403 Forbidden` → scope not granted; request `gmail.readonly` scope
- If query returns 0 results → suggest broadening the search (remove date filters, check spelling)
- If message body is empty → check for multipart MIME parts; try `text/plain` then `text/html`

## Connectors (Optional)
This skill works standalone. When connected to external tools, it unlocks additional capabilities:

| Connector | What it enables |
|-----------|----------------|
| ~~email | Read Gmail inbox and search messages via the Gmail API |
| ~~calendar | Cross-reference emails with calendar events for meeting context |
| ~~drive | Access attachments and linked Google Drive files from emails |
| ~~notes | Save important email content and action items to notes |

## Rules
- Scope required: `https://www.googleapis.com/auth/gmail.readonly`
- Base URL: `https://gmail.googleapis.com/gmail/v1/users/me`
- Always include `Authorization: Bearer <access_token>` header
- Message body is base64url encoded — always decode before displaying
- For multipart messages: prefer `text/plain` part; fall back to `text/html` (strip tags)
- Default `userId` is `me` (authenticated user)
- Never display raw base64 content to the user
- Max results per page: 100 (use `pageToken` for pagination)
- Common search operators: `from:`, `to:`, `subject:`, `is:unread`, `is:starred`, `has:attachment`, `label:`, `after:YYYY/MM/DD`, `before:YYYY/MM/DD`

## Output Template
```
GMAIL SEARCH RESULTS
=====================
Query:   [search query]
Found:   [N] messages

[N]. Subject: [subject]
    From:    [sender]
    Date:    [MM/DD/YYYY HH:MM AM/PM]
    Snippet: [first ~100 chars of body]
```

## Related Skills
- `email-assistant` -- For composing replies to emails found via Gmail Reader
- `document-summarizer` -- For summarizing long email threads
- `drive-reader` -- For accessing files attached or linked in emails
