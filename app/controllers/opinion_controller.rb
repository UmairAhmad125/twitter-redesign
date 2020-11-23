class OpinionController < ApplicationController
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.new(opinion_params)
    if @opinion.save
      redirect_to root_path
    else
      flash.now[:alert] = 'minimum 5 and max 500 words are allowed'
      render 'new'
      flash[:alert] = 'minimum 5 and max 500 words are allowed'
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
