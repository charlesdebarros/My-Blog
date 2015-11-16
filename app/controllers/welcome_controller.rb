# Welcome controller
class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
    @projects = Project.all.order('created_at DESC')
  end
end
