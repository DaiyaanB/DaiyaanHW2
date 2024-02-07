# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
#rails generate model Studio - Did this in terminal, then edited the newly-created db-migrate files as shown in files before running rails db:migrate
#rails generate model Movie
#rails generate model Actor
#rails generate model Role

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

#I worked with Chat GPT 4.0 to generate the data entry prompts based on the given sample data, and my explanation to GPT of the desired dynamic ID look-up method we learned previously in class in "Lab 3-associations"

# Create the studio
warner_bros = Studio.create!("name" => "Warner Bros.")

# Create the movies using hash-like access for studio id (Based on me explaining to GPT how we did Lab 3 last class)
batman_begins = Movie.create!("title" => "Batman Begins", "year_released" => 2005, "rated" => "PG-13", "studio" => warner_bros["id"])
the_dark_knight = Movie.create!("title" => "The Dark Knight", "year_released" => 2008, "rated" => "PG-13", "studio" => warner_bros["id"])
the_dark_knight_rises = Movie.create!("title" => "The Dark Knight Rises", "year_released" => 2012, "rated" => "PG-13", "studio" => warner_bros["id"])

# Create actors
christian_bale = Actor.create!("name" => "Christian Bale")
michael_caine = Actor.create!("name" => "Michael Caine")
liam_neeson = Actor.create!("name" => "Liam Neeson")
katie_holmes = Actor.create!("name" => "Katie Holmes")
gary_oldman = Actor.create!("name" => "Gary Oldman")
heath_ledger = Actor.create!("name" => "Heath Ledger")
aaron_eckhart = Actor.create!("name" => "Aaron Eckhart")
maggie_gyllenhaal = Actor.create!("name" => "Maggie Gyllenhaal")
tom_hardy = Actor.create!("name" => "Tom Hardy")
joseph_gordon_levitt = Actor.create!("name" => "Joseph Gordon-Levitt")
anne_hathaway = Actor.create!("name" => "Anne Hathaway")

# Assign roles to actors in movies using hash-like access for movie and actor ids
Role.create!("movie" => batman_begins["id"], "actor" => christian_bale["id"], "character_name" => "Bruce Wayne")
Role.create!("movie" => batman_begins["id"], "actor" => michael_caine["id"], "character_name" => "Alfred")
Role.create!("movie" => batman_begins["id"], "actor" => liam_neeson["id"], "character_name" => "Ra's Al Ghul")
Role.create!("movie" => batman_begins["id"], "actor" => katie_holmes["id"], "character_name" => "Rachel Dawes")
Role.create!("movie" => batman_begins["id"], "actor" => gary_oldman["id"], "character_name" => "Commissioner Gordon")

Role.create!("movie" => the_dark_knight["id"], "actor" => christian_bale["id"], "character_name" => "Bruce Wayne")
Role.create!("movie" => the_dark_knight["id"], "actor" => heath_ledger["id"], "character_name" => "Joker")
Role.create!("movie" => the_dark_knight["id"], "actor" => aaron_eckhart["id"], "character_name" => "Harvey Dent")
Role.create!("movie" => the_dark_knight["id"], "actor" => michael_caine["id"], "character_name" => "Alfred")
Role.create!("movie" => the_dark_knight["id"], "actor" => maggie_gyllenhaal["id"], "character_name" => "Rachel Dawes")

Role.create!("movie" => the_dark_knight_rises["id"], "actor" => christian_bale["id"], "character_name" => "Bruce Wayne")
Role.create!("movie" => the_dark_knight_rises["id"], "actor" => gary_oldman["id"], "character_name" => "Commissioner Gordon")
Role.create!("movie" => the_dark_knight_rises["id"], "actor" => tom_hardy["id"], "character_name" => "Bane")
Role.create!("movie" => the_dark_knight_rises["id"], "actor" => joseph_gordon_levitt["id"], "character_name" => "John Blake")
Role.create!("movie" => the_dark_knight_rises["id"], "actor" => anne_hathaway["id"], "character_name" => "Selina Kyle")

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
#Worked with Chat GPT 4.0 and the code-along 3-associations.rb to implement a similar loop

myMovies = Movie.all
for movie in myMovies
  # Using hash-like access for attributes
  studio_name = Studio.find(movie["studio"]).name #Admitedly only one studio in the set, but less hard-coded this way...
  puts "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio_name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

myCast = Role.all

for movie in myMovies
    for role in myCast
        # Check if the role belongs to the current movie
        if role.movie == movie.id
            # Find the actor for this role using the foreign key
            actor = Actor.find(role.actor)
            # Print the movie title, actor name, and character name
            puts "#{movie.title} #{actor.name} #{role.character_name}"
        end
    end
end


