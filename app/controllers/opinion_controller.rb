class OpinionController < ApplicationController
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.new(opinion_params)
    if @opinion.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
