class PagesController < ApplicationController

  def home
  end

  def about
  end

end



# pages#home
#
# @three_key_articles = []
# @three_key_articles << Article.find_by(title: "Via Ferrata in Innsbruck")
# @three_key_articles << Article.find_by(title: "Jumping Off Stuff")
# @three_key_articles << Article.find_by(title: "The Epic Cows of Scotland")
#
#
# <div class="articles">
#   <ul>
#     <% @three_key_articles.each do |article| %>
#       <%= <a href="#{article.id}"> <li>article.name<li><a> %>
#     <% end %>
#   </ul>
# </div>
