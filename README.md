<h3>Bloccit</h3>

Bloccit is a Ruby on Rails application that allows users to create topics and posts. Users are able to up/down vote posts as well as favorite them. All aspects for this app were custom built, including authentication and authorization, in order to gain a thorough understanding of their functionality.

The source code is here on GitHub: https://github.com/cdekk3r/bloccit

This app was created as part of the Bloc Full Stack Web Development course.

<h3>Features</h3>

- Users can create a standard account in order to create and edit topics and posts.
- Users can up/down vote any post. A list of their posts is displayed on their profile with their vote score.
- Users can favorite posts, which are then saved on their user profile for easy tracking.

<h3>Deployment</h3>

To run Bloccit locally:

- Clone the repository
- Run bundle install
- Create and migrate the SQLite database with `rake db:create` and 'rake db:migrate`
- Start the server using `rails s` or for cloud9 users `rails s -b $IP -p $PORT`

<h3>Languages and Frameworks:</h3> Ruby on Rails and Bootstrap

Ruby version 4.2.5

<h3>Development Tools and Gems include:</h3>

- BCrypt for secure passwords
- SendGrid for email confirmation
- Bootstrap
- RSpec

<h3>Explanation</h3>

Bloccit is my first project built on Rails after completing the Bloc Ruby fundamentals. It is a simple forum-type application similar to the popular site Reddit.

<h3>Problem</h3> 

One of the first problems I ran into was properly associating comments to a post. I had the correct `belongs_to` and `has_many` associations in the comment and post models respectively. To double check that it
was working properly I went into the console to create a comment for a selected post.

`post = Post.create(title: "post title", body: "post body")`
`post.comments.create(body: "comment body")`

In the output I noticed that the `post_id` column showed as nil indicating they were not properly associated.

<h3>Solution</h3>

After doing some research I learned this is done using a foreign key. A foreign key is an attribute from one model used in another model, which is exactly what I was missing. 
When creating the comment model I needed to have a reference to the post. This is done simply by adding an adding additional attribute when the model is generated.

`$ rails generate model Comment body:text post:references`

The last bit `post:references` fixed the issue I was seeing in the console. Referring back to our associations each comment "belongs to" a post so each comment should have the identifier for which post it 
belongs to.