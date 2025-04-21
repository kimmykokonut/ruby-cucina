# Ruby Cucina

a digital recipe collection to share with the next generation that won't open a physical cookbook

---

## User Stories: basic MVP/CRUD
A user will be able to....
* create a unique account
* create a recipe via form, mark as public/private
* ingredients are saved from db and available as auto-fill, if don't exist, can add. (persist store?)
* add a photo
* see recipes as a list, starting with their own, then public (tabs?)
* recipe detail page, if owner, can edit/delete

## Stretch Goals
* filter recipes by tags
* search by ingredient
* sort by new/popular
* favoriting other public recipes
* serving size adjuster
* cook time/difficulty level?
* print friendly version
* AI photo parse recipe from photo/pdf
* Mobile version
* share public recipes via link
* comment on public recipes?
* rate recipes?
* dark mode
* shopping list generator
* save recipe drafts
* duplicate recipe to make own version

## Kitchen Helper:
Common substitutions for ingredients
Unit converter (cups to ml, etc.)
Timer function built into recipes

---

## Build deets
* Docker Desktop
* VS Code: Dev Container Extension
* Ruby version: `3.4.2`
* Rails 8.1.0.alpha
* DB: PostgreSQL

### Setup

Run local server within container terminal.
`$ cd ruby-cucina`
`$ bin/rails server`
App is running at `http://localhost:3000/`

DB migration
`$ bin/rails db:migrate`

Rails Console (play with db)
`$ bin/rails console`
To exit: `ctrl + d`

...wip...
* System dependencies

* Configuration

* Database creation

2025.04.21 Current db associations
![PostgreSQL Relationships](/app/assets/images/db_associations.png)

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

...notes to self...
* add validation later for auth, simple for now.
