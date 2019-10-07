crumb :root do
  link "メルカリ", root_path
end

# category index
crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category_search do
  category = Category.find(params[:id])
  link "#{category.name}", search_category_path(category)
  parent :categories
end

crumb :mypage do
  user = User.find(params[:id])
  name = params[:name]
  link "#{name}", user_path(user)
  parent :root
end
