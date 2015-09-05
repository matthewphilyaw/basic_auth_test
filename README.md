# FooApi

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Basic Auth Example

  1. Ensure steps 1 and 2 under `to start your phoenix app` has been done
  2. Then run the `insert_user.sql` script to seed the database with a user `username: user, password: password`
  3. run phoenix as detailed above
  4. then in the browser hit localhost:4000/api/bars should ask for username passowrd. admin password should let you see the request, base combo will produce a 401
