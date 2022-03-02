# rails-crud
1 - inside /development -> docker-compuse up

2 - sudo docker exec -it <development_web container id> bash

3 - inside development_web container -> rake db:setup

4 - inside development_web container -> rake db:migrate

5 - inside development_web container -> rake db:seed

to test: inside development_web container -> bundle exec rspec spec/models/proposal_spec.rb
