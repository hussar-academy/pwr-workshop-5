# Przetwarzanie Formularza Railsowego

Załóżmy, że chcemy dodawać Diga metodą Railsową:
(uwaga, przykład trochę celowo nie zadziała w naszej aplikacji z powodu powodów :)
Między innymi dlatego, że już posiadamy Controller dla `Digs` w naszym API)

```ruby
#     not an API ▼
# app/controllers/digs_controller.rb
class DigsController < ApplicationController
  # this renders view with form
  def new
  end

  # process form
  def create
    Dig.create!(dig_params)

    # we don't return JSON, but we can redirect user (in this case to root path)
    redirect_to root_path
  end

  private
    def dig_params
      ...
    end
end

# config/routes.rb
...
get 'digs', to: 'digs#new'
post 'digs', to 'digs#create'
...
```

```slim
# app/views/digs/new.html.slim
= form_tag digs_path do
  = label_tag :title
  = text_field_tag :title
  br
  = label_tag :body
  = text_field_tag :body
  br
  = submit_tag 'Create'
```

