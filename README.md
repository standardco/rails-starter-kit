# Rails Starter Kit

Rails Starter Kit was created as a way to save time when starting a new Rails project. We have taken the most common functionality and configuration in our existing Rails projects, and put those into this project. Simply clone this project, and change the git remote to your remote repository. Rails Starter Kit is ready to host on Heroku.

## Start using Rails Starter Kit

1. Create a new repository on GitHub, BitBucket, or your own server
2. Create a directory for your new project, and go into it
3. Clone Rails Starter Kit into your new folder
4. Change the git remote to your new repository
5. Push changes

After creating the new repository, follow these steps in the terminal:

	$ mkdir demo
	$ cd demo
	$ git clone git@github.com:codeisstandard/rails-starter-kit.git .
	$ git remote set-url origin git@github.com:[org/repo.git]
	$ git push origin master


To update the following files with your project name, run the following command in the terminal:

  $ rake project:setup

  This will update:

  - README.md
  - app/views/layouts/application.html.erb
  - config/database.yml
  - config/initializers/session_store.rb
  - config/application.rb

Just a couple more things before you dive in:


- Update the mailer host in `config/environments/development.rb` and `config/environments/production.rb`

If everything goes well, you should be ready to start work on your new project.

## Integration with React JS
This application utilizes the ['react-rails' gem](https://github.com/reactjs/react-rails) to integrate the [React JS](https://reactjs.org/) library into the codebase. To generate a new React component:
```
$ rails g react:component HelloWorld greeting:string
```
Here we are telling rails to generate a new React component. The name of the component is **HelloWorld**, this component has one *prop*, **greeting**, and greeting has a data type of **string**.

This command results in a new JS file under `/app/javascript/components/` which will contain all of the logic for the component. In order to render the component to the screen, you can simply use the helper method included with the 'react-rails' gem.
```
<%= react_component("HelloWorld", { greeting: "Hello" }) %>
```  


## Out-of-the-box functionality

- Bootstrap with SASS
- Procfile and 12factor gem for Heroku compatibility
- Environment variables
- Upload to S3
- Sidekiq configuration for background processing
- User authentication via [Devise](https://github.com/plataformatec/devise)
- Mailer configuration
- Flash message placeholders

## References

Also check out Rails Best Practices: https://github.com/codeisstandard/rails-best-practices
