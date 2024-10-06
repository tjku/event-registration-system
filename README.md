# Event Registration System

System contains two user roles: an organizer and a participant.

Organizer can:
* log in;
* create an event;
* see a list of his events;
* see a list of participants registered to his specific event;
* limit number of participants that can register to his specific event.

Participant can:
* log in;
* register to an event;
* see a list of all events that he is regestered to.

## Setup

1. Run `git clone git@github.com:tjku/event-registration-system.git` to download repository.

2. Install Ruby 3.3.5 version.
   To do it, you can use [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv/).

3. Install SQLite3.

4. Create and migrate the database:

   ```
   bundle exec rails db:create
   bundle exec rails db:migrate
   ```

5. Seed the database:

   ```
   bundle exec rails db:seed
   ```
