class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params["range"]

    if @range == "ユーザー"
      @users = User.looks(params["search"], params["word"])
    else
      @recruitments = Recruitment.looks(params["search"], params["word"])
    end
  end
end
  

