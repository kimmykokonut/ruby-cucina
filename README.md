# Ruby Cucina

A digital recipe collection built with Ruby on Rails, designed to modernize recipe management and sharing.

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/tailwindcss-%2338B2AC.svg?style=for-the-badge&logo=tailwind-css&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![Markdown](https://img.shields.io/badge/markdown-%23000000.svg?style=for-the-badge&logo=markdown&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

Ruby Cucina solves the problem of managing and sharing family recipes in the digital age. Instead of relying on physical cookbooks or scattered digital notes, it provides a centralized platform where users can:
- Store and organize their cherished recipes
- Share selected recipes with family members
- Search through ingredients and cooking times
- Track recipe details with modern features like prep time and photo attachments

## Table of Contents
* <a href="#features">Features</a>
* <a href="#build-details">Build Details</a>
* <a href="#database-schema">Database Schema</a>
* <a href="#setup-instructions">Setup Instructions</a>
* <a href="#development">Development</a>
    * <a href="#rails-console">Rails Console</a>
     * <a href="#testing">Testing</a>
* <a href="#wip">WIP</a>
    * <a href="#known-bugs">Known Bugs</a>
    * <a href="#front-end">Front End</a>
    * <a href="#back-end">Back End</a>
    * <a href="#stretch-goals">Stretch Goals</a>
* <a href="#contact-and-support">Contact and Support</a>
* <a href="#license">License</a>

## Features

* User authentication and recipe ownership (wip: front end)
* Recipe management (CRUD operations) - (wip: front end)
* Tag-based recipe organization
* Detailed recipe information including:
  - Title and instructions
  - Prep and cook time tracking
  - Yield information (amount and unit)
  - Photo attachments with variants
  - Ingredients with amounts
* Time-based categorization (Under 1 hour, 1-2 hours, 2+ hours)

## Build Details
* Docker Desktop
* VS Code with Dev Container Extension
* Ruby version: `3.4.2`
* Rails 8.1.0.alpha
* Database: PostgreSQL
* Frontend Styling: TailwindCSS
* Active Storage for photo attachments

## Database Schema

The application uses PostgreSQL with the following models:
* Users - Account management and recipe ownership
* Recipes - Core recipe information including:
  - Title
  - Instructions (stored as JSON)
  - Prep and cook times
  - Yield amount and unit
  - Photo attachments
* Tags - For recipe organization and filtering
* Ingredients - Ingredient database
* RecipeTags - Join table linking recipes and tags
* IngredientRecipes - Join table linking recipes and ingredients with amounts

Current database associations:
![PostgreSQL Relationships](/app/assets/images/db_associations.png)

## API Endpoints

Base URL: `http://localhost:3000`

| Method | Endpoint | Description |
| :---: | :---: | :---: |
|  | Recipes |
| GET | `/recipes` | Get all recipes (public ones if not authenticated) |
| GET | `/recipes/:id` | Get a specific recipe by ID |
| POST | `/recipes` | Create a new recipe |
| PATCH/PUT | `/recipes/:id` | Update a recipe |
| DELETE | `/recipes/:id` | Delete a recipe |
| | Ingredients |
| GET | `/ingredients` | Get all ingredients |
| GET | `/ingredients/search` | Search ingredients (autocomplete) |
| GET | `/ingredients/:id` | Get a specific ingredient |
| POST | `/ingredients` | Create a new ingredient |
| PATCH/PUT | `/ingredients/:id` | Update an ingredient |
| DELETE | `/ingredients/:id` | Delete an ingredient |
| | Tags |
| GET | `/tags` | Get all tags |
| GET | `/tags/:id` | Get a specific tag |
| POST | `/tags` | Create a new tag |
| PATCH/PUT | `/tags/:id` | Update a tag |
| DELETE | `/tags/:id` | Delete a tag |
| | Users |
| GET | `/users` | Get all users |
| GET | `/users/:id` | Get a specific user profile |
| POST | `/users` | Create a new user account |
| PATCH/PUT | `/users/:id` | Update user profile |
| DELETE | `/users/:id` | Delete user account |
| | Application |
| GET | `/` | Home page (recipe index) |
| GET | `/up` | Health check endpoint |

## Setup Instructions

1. Prerequisites:
   * [Docker Desktop](https://docs.docker.com/desktop/) installed and running
   * VS Code with Dev Containers extension

2. Installation:
   ```bash
   # Clone the repository
   $ git clone https://github.com/kimmykokonut/ruby-cucina
   $ cd ruby-cucina

   # Open in VS Code Dev Container
   $ code .
   # Select "Reopen in Container" when prompted

   # Install dependencies
   $ bundle install

   # Database setup
   $ bin/rails db:create
   $ bin/rails db:migrate
   ```

3. Running the Application:
   ```bash
   # Start the Rails server
   $ bin/rails server

   # In a separate terminal, start Tailwind CSS compilation (development)
   $ bin/rails tailwindcss:watch
   ```
   Access the application at `http://localhost:3000`

## Development

### Rails Console
Access the Rails console for database interaction:
```bash
bin/rails console
```
To exit: `ctrl + d`

### Testing
```bash
# Run the test suite
bin/rails test

# Run specific test file
$ bin/rails test test/models/recipe_test.rb

# Run tests with coverage report
$ COVERAGE=true bin/rails test
```

## WIP

### Known Bugs
* Issue putting ingredient auto-fill field input within create recipe form. Works independently on /ingredients. Api not working because it is ingredient `form_with` within the recipe form `form_with`.

### Back end
* Add stricter user validation for auth once site further along
* Add authentication routes/controllers

### Front end
* User sign in/up
* Change create recipe to Form Wizard
* Dashboard with list of user's recipes
* Add edit/delete to recipe detail page (if owner)

### Stretch Goals
* filter recipes by tags
* sort by options
* favoriting other public recipes
* serving size adjuster
* print friendly version
* AI photo parse recipe from photo/pdf
* Mobile version
* share public recipes via link
* comment on public recipes
* rate recipes
* dark mode
* shopping list generator
* duplicate recipe to make own version
* Kitchen Helper:
    * Common substitutions for ingredients
    * Unit converter (cups to ml, etc.)
    * Timer function built into recipes

### Contact and Support

If you have any feedback or concerns,
[Report Bug](https://github.com/kimmykokonut/ruby-cucina/issues)
[Request Feature](https://github.com/kimmykokonut/ruby-cucina/issues)

### License

GNU General Public License v3.0, See license.md for more information
