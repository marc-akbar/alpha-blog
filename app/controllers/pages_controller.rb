class PagesController < ApplicationController

  def home
  end

  def about
  end

end



# pages#about
#
# @three_key_articles = []
# @three_key_articles << Article.find_by(name: LLamas doing extreme shit)
# @three_key_articles << Article.find_by(name: alpine llamas extreme)
# @three_key_articles << Article.find_by(name: llamas drinking caffeine)
#
#
#
#
#
# def about
#  render about.html.erb
# end
#
# <div class="articles">
# <ul>
# <% @three_key_articles.each do |article| %>
#  <%= <a href="#{article.id}"> <li>article.name<li><a> %>
# <% end %>
# </ul>
