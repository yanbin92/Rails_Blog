Rails.application.routes.draw do
 #把 comments 放在 articles 中，这叫做嵌套资源，表明了文章和评论间的层级关系。
#关于路由的详细介绍，参阅“Rails 路由全解”一文。
  resources :articles do
  	resources :comments
  end

  #get 'welcome/index'
	
  root 'welcome#index' 
  

	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
