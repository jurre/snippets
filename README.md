Snippets
========

A simple HAL+JSON service that let's you post code snippets.

The idea behind this is mostly to explore an alternative project structure.
We've been stuck in this 'group things by design pattern' mode for a long time
but I'm wondering if that's actually the best way to structure an API.

Instead what I'm trying out here is grouping things by resource instead. So
everything related to Users will go in `app/user`. It will usually have a
model, a representer (or serializer) and a route but it could differ per
resource.

Right now there is a `snippets` endpoint that lets you list and create snippets.
The folder that holds all of the code regarding this enpoint looks like this:
```
- app
  - base
  - snippet
    - collection.rb
    - model.rb
    - representer.rb
    - route.rb
```

The idea behind this isn't new, there's [trailblazer](http://trailblazer.org)
for rails, but since rails is quite rigid in the way to structure things, there
are still models, controllers and views folders so not everything is grouped
together, here we don't have that. Everything is grouped per resource.
