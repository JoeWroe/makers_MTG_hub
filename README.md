[![Circle CI](https://circleci.com/gh/MakersMTG/makers_MTG_hub/tree/master.png?style=badge&circle-token=:circle-token)](https://circleci.com/gh/MakersMTG/makers_MTG_hub/tree/master)

Live site: https://makers-mtg-hub.herokuapp.com/

## Ruby version

This project at the moment uses Ruby 2.2.2


## Setup

Navigate to a projects directory and clone the repository
```bash
> git clone https://github.com/MakersMTG/makers_MTG_hub.git
```
Then `cd` into the directory. You'll want to `bundle install` next.


## Database

Ensure you're all set up with `psql`.
To setup the databases run `bundle exec rake db:migrate`


## How to run the test suite

Fairly simple! Ensure you're in the project directory at root level and then run:
```bash
> bundle exec rspec
```


## Deployment instructions

Deploying to Heroku is triggered automatically on a successful push to the `production` branch.
Assuming master is passing CI follow these steps to deploy

```bash
# from project directory
> git checkout master
> git pull -r # update local master branch
> git checkout production
> git rebase master # rebase production branch to include new commits from master
> git push origin +production # push updated production branch and trigger deployment
```
Then have a look at the [live new things](https://makers-mtg-hub.herokuapp.com/) you've done! You will have to wait for CI to pass on the production branch and then for Heroku to build.

If for some reason you need to migrate the production database:
NB: you will need heroku app access for this. Speak to Edward to obtain authorisation. :)
```bash
> heroku login
> heroku run rake db:migrate
```
