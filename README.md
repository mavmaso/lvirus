# L Virus
 
It’s a a simple game, as a solution for the proposed problem below. The propose here is the use LiveView.

### Proposal Problem

  The world, as we know it, has fallen into an apocalyptic scenario. The Like-twiter Virus is transforming human beings into stupid beasts (a.k.a. Zombies), hungry to cancel humans and eat their limbs.

  You, the last survivor who knows how to code, will help the resistance by deploying a system to connect the remaining humans. This system will be essential to detect new infections and share resources between the members.

## Deps for Linux

- `sudo apt update`
- `sudo apt upgrade`
- `sudo apt install -y build-essential libssl-dev zlib1g-dev automake autoconf libncurses5-dev`
- `asdf install`

## Install using ASDF

NB: **⚠ MAC (M1, M2) users**: Use this before installing ASDF

```bash
export KERL_CONFIGURE_OPTIONS="--without-wx --without-javac"
export ERLANG_OPENSSL_PATH="/usr/local/opt/openssl"

# Open SSL is required before installing ASDF
brew install openssl
```

- `asdf plugin-add erlang`
- `asdf plugin-add elixir`

## In loco Setup

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`
- Run complete tests `mix test`

## Docker
- docker-compose build
- docker-compose run --rm web mix deps.get
- docker-compose run --rm web mix ecto.setup
- docker-compose run --rm web mix test
- docker-compose up --force-recreate

## Database
  PostgreSQL
  ```
  username: postgres
  password: postgres
  ```

## Made by

 - [mavmaso](https://github.com/mavmaso)