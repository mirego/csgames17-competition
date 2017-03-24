# CS Games 2017 - Mobile - Server

## User Routes

#### POST `/api/login`

Validate a user's credentials.

**Request**

| parameter  | type     | description |
| ---------- | -------- | ----------- |
| `username` | _string_ | Username    |
| `password` | _string_ | Password    |


**Response**

`200 OK` Valid credentials:

| parameter  | type     | description                            |
| ---------- | -------- | -------------------------------------- |
| `_id`      | _string_ | Unique user identifier                 |
| `username` | _string_ | Username                               |
| `url`      | _string_ | Public URL of the user profile picture |

`401 Unauthorized` Invalid credentials.

---

#### POST `/api/users`

Register a new user.

**Request**

| parameter        | type     | description                            |
| ---------------- | -------- | -------------------------------------- |
| `username`       | _string_ | Username                               |
| `password`       | _string_ | Password                               |
| `url` (optional) | _string_ | Public URL of the user profile picture |

**Response**

`200 OK` Valid credentials:

| parameter  | type     | description                            |
| ---------- | -------- | -------------------------------------- |
| `_id`      | _string_ | Unique user identifier                 |
| `password` | _string_ | Username                               |
| `url`      | _string_ | Public URL of the user profile picture |

`401 Unauthorized` Invalid credentials.

## Conversation Routes

#### GET `api/users/:user_id/conversations`

List all open conversations for a specific user.

**Response**

`200 OK` Conversation list:

| parameter         | type     | description                               |
| ----------        | -------- | ----------------------------------------- |
| `conversations`   | _array_  | List of conversations                     |
| – `_id`           | _string_ | Unique conversation identifier            |
| – `lastMessage`   | _object_ | Last message sent in the conversation     |
| – – `userId`      | _string_ | Sender of the message                     |
| – – `message`     | _string_ | Contents of the message                   |
| – – `timestamp`   | _date_   | Time the message was sent ([ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) format) |
| `users`           | _array_  | List of user objects referred in the body |

---

#### POST `/api/users/:user_id/conversations`

Create a new conversation.

**Request**

| parameter  | type     | description                               |
| ---------- | -------- | ----------------------------------------- |
| `users`    | _string_ | Array of user IDs in the conversation (2) |


**Response**

`200 OK` New conversation object:

| parameter         | type     | description                               |
| ----------        | -------- | ----------------------------------------- |
| `conversations`   | _array_  | List of conversations                     |
| – `_id`           | _string_ | Unique conversation identifier            |
| – `messages`      | _array_  | Empty array of messages (new thread)      |
| – `users`         | _array_  | List of IDs of users in the conversation  |
| `users`           | _array_  | List of user objects referred in the body |

`422 Unprocessable Entity`:

- Users not found for conversation
- Conversations must have 2 users, including the current user (`:user_id`)

---

#### GET `/api/users/:user_id/conversations/:conversation_id`

Read a conversation details.

**Response**

`200 OK` New conversation object:

| parameter         | type     | description                               |
| ----------        | -------- | ----------------------------------------- |
| `conversations`   | _array_  | List of conversations (1)                 |
| – `_id`           | _string_ | Unique conversation identifier            |
| – `messages`      | _array_  | Empty array of messages (new thread)      |
| – – `userId`      | _string_ | Sender of the message                     |
| – – `message`     | _string_ | Contents of the message                   |
| – – `timestamp`   | _date_   | Time the message was sent ([ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) format) |
| – `users`         | _array_  | List of IDs of users in the conversation  |
| `users`           | _array_  | List of user objects referred in the body |

`422 Unprocessable Entity`:

- Users not found for conversation
- Conversations must have 2 users, including the current user (`:user_id`)

---

#### POST `/api/users/:user_id/conversations/:conversation_id`

Write a new message to the conversation

**Request**

| parameter  | type     | description                               |
| ---------- | -------- | ----------------------------------------- |
| `message`  | _string_ | Contents of the message to add            |

**Response**

`200 OK` Updated conversation object:

| parameter         | type     | description                               |
| ----------        | -------- | ----------------------------------------- |
| `conversations`   | _array_  | List of conversations (1)                 |
| – `_id`           | _string_ | Unique conversation identifier            |
| – `messages`      | _array_  | Empty array of messages (new thread)      |
| – – `userId`      | _string_ | Sender of the message                     |
| – – `message`     | _string_ | Contents of the message                   |
| – – `timestamp`   | _date_   | Time the message was sent ([ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) format) |
| – `users`         | _array_  | List of IDs of users in the conversation  |
| `users`           | _array_  | List of user objects referred in the body |

`422 Unprocessable Entity` Message cannot be empty.

