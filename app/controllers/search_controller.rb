class SearchController < ApplicationController
  def search
  	@posts=Post.search(params[:q].present? ? params[:q] : '*').records
  end
end
