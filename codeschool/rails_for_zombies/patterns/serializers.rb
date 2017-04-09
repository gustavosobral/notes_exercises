# Overriding the convention and use a custom serializer
render json: @items, serializer: SomeOtherSerializer

class Item < ActiveRecord::Base
  def active_model_serializer
    SomeOtherSerializer
  end
end

# Removes root note
render json: @items, root: false

render json: @items, serializer: ItemsCollectionSerializer

class ItemsCollectionSerializer < ActiveModel::ArraySerializer
  self.root = false
end

# Side-loading comments
class ItemSerializer < ActiveModel::Serializer
  has_many :comments
  embed :id, include: true
end

# Override association methods to filter records
class ItemSerializer < ActiveModel::Serializer
  has_many :comments

  def comments
    object.comments.approved
  end
end

# Custom scope
class ApplicationController < ActionController::Base
  serialization_scope :logged_user
end

render json: @items, scope: logged_user, scope_name: :logged_user
