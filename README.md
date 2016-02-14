# Open Source Job Board

**[DEMO](https://reactnativejobs.herokuapp.com/)**

![Screenshot](https://cdn.rawgit.com/blairanderson/open-source-job-board/master/public/screenshot.png)

This is the `readme.md` for a Ruby on Rails application that allows users to create accounts and post job listings.

### Why?

Because when i was learning to program, I wanted to play with code that had a familiar model and get some instant gratification.

The problem with learning to code is the learning-curve. Shit is real and painful and i found that the best cure for the pain was cloning an app with features and tweaking until it broke and learning along the way.

I think this is why wordpress is SO popular. Its stupid-easy to fire-up, and changes come with one-click package installs and tiny code changes.



### Features

- A visitor can view the list of job posts
- A visitor can view the job form, but is forced to signup before filling it out.
- A visitor can register for an account
- A user can login and logout
- A user can submit a new job post
- Admin dashboard at `/admin`, config in `rails_admin.rb` - admin is `user.id==1`
- Posts can be `draft, published, archived`


### Deploy?

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

*[learn more about](https://devcenter.heroku.com/articles/app-json-schema)*

### Change the Code!!!

My main goal for this is to give new programmers some code to look at and talk about. Anytime i [get questions](https://github.com/blairanderson/open-source-job-board/issues), I plan to add them here...

If you're new to rails, follow this and come back http://installfest.railsbridge.org/installfest/

*Open your terminal*

```bash

$ git clone git@github.com:blairanderson/open-source-job-board.git jobbr
$ cd jobbr

```

*Lets look at some code*

When someone visits your website, they're literally just *request*ing some HTML, CSS, and Javascript! *requests* come to your application through the ROUTER.

SO you type something into google and hit enter, then click to the first result....

your web browser visits a website and the website starts to send HTML and CSS and Javascript.

### [Checkout the Routes File](https://github.com/blairanderson/open-source-job-board/blob/master/config/routes.rb)
