## Setup and Install Dependencies

- Setup .env
- Run the script below

```bash
# Install dependencies
bundle install

# Once it's all installed  run a db migrate
rails db:migrate
# repeat? reset db
rails db:reset db:migrate

# start the server
rails s

ngrok http 3000
```

Browse to the website [https://<ngrok-sub-domain>.ngrok.io](https://<ngrok-sub-domain>.ngrok.io) and click to send yourself a notification.
