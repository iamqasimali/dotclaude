# Rule: API (Rails)

paths:
  - "app/controllers/**/*"
  - "config/routes.rb"

## Controllers
- Inherit from `ApplicationController` (or `Api::BaseController` for APIs)
- Use `before_action :authenticate_user!` for every protected action
- Never trust `params[:user_id]` – always use `current_user.id`
- Use `authorize @resource` (Pundit) before mutating anything
- Respond with `render json: { error: "message" }, status: :unprocessable_entity`

## Strong Parameters
```ruby
def post_params
  params.require(:post).permit(:title, :body, :published)
end
```
- Never use `params.permit!`
- For nested resources, explicitly permit nested attributes

## Serializers
- Use `ActiveModel::Serializer` or `jsonapi-serializer`
- Never render `@user.as_json` – it may expose the password digest

## Error Handling
- Rescue known errors at the controller level
- `rescue_from ActiveRecord::RecordNotFound, with: :not_found`
- Central error handler renders consistent `{ error: message }` JSON

## Routes
- Use resourceful routes: `resources :posts`
- Namespace API versions: `namespace :api do namespace :v1 do`
- Avoid custom action names when a resourceful route fits
