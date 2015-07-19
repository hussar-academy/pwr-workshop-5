class Api::DigsController < ApplicationController
  before_action :authorize_api

  def index
    render json: Dig.all
  end

  def show
    render json: Dig.find(params[:id])
  end

  def create
    render json: Dig.create!(dig_params)
  end

  def update
    dig = Dig.find(params[:id])
    dig.update!(dig_params)

    render json: dig
  end

  def destroy
    dig = Dig.find(params[:id])
    dig.destroy!

    head 200
  end

  def vote
    dig = Dig.find(params[:id])
    random_user = User.all.sample(1).first
    dig.votes.create! amount: params[:vote], voter: random_user

    head 200
  end

  def comments
    dig = Dig.find(params[:id])

    render json: dig.comments
  end

  def comment
    render json: Comment.find(params[:comment_id])
  end

  private
    def dig_params
      params.require(:dig).permit(:title, :body, :owner_id)
    end
end

