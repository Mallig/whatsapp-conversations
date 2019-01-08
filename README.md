## WhatsApp Conversations API

### Routes

|route |    |  description |
|-----|-----|---------------|-------|
|  /  |                      |  Welcome visitor
|     |  /:user_id           |  all messages from a single user
|     |  /:user_id/:user_id  |  all messages between two users
|     |  
| /messages |                |  All messages
|     |  /:id                |  Single message
|     |  
|  /conversations  |         |  All conversations
|      |  /:id               | single conversation

## MVP

|route |    |  description |
|-----|-----|---------------|-------|
|  /  |                      |  Welcome visitor
|     |  /:sender_id/:receiver_id  |  all messages between two users

