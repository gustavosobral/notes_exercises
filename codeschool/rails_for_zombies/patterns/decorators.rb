class Post < ActiveRecord::Base
end

class PostsController < ApplicationController
  def show
    post = Post.find(params[:id])
    @post_decorator = PostDecorator.new(post)
  end
end

class PostDecorator
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def is_front_page?
    post.published_at > 2.days.ago
  end

  def method_missing(method_name, *args, &block)
    post.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    post.respond_to?(method_name, include_private) || super
  end
end
