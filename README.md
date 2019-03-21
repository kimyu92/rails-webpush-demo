## Setup and Install Dependencies

- Setup `.env` by referring to `.env.sample`
- Run the script below

```bash
# Install dependencies
bundle install

# Once it's all installed  run a db migrate
rails db:migrate db:seed
# repeat? reset db
rails db:drop db:migrate db:seed

# start the server
rails s

ngrok http 3000
```

Browse to the website [https://ngrokSubDomain.ngrok.io](https://ngrokSubDomain.ngrok.io) and click to send yourself a notification.
