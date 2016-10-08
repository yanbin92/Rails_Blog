class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "yanbin",
	password: "y112233",
	except: [:index,:show]

	def new
		#在 new 动作中加入 @article = Article.new 的原因是，如果不这么做，在视图中 @article 的值就是 nil，调用 @article.errors.any? 时会发生错误。
		@article=Article.new
	end

	def create
	  @article = Article.new(article_params)
	 
	  if @article.save
           #而 redirect_to 会让浏览器发起一次新请求
	   redirect_to @article
	  else
	    #用 render 方法才能在保存失败后把 @article 对象传给 new 动作的视图 渲染操作和表单提交在同一次请求中完成
	    render 'new'
	  end	
	end

	def show
		p params[:id]
		@article=Article.find(params[:id])
	end
	
	def index
	   @articles=Article.all
	end
	 
	def edit
		@article=Article.find(params[:id])
	end

	def update 
		@article=Article.find(params[:id])

		if(@article.update(article_params))
			redirect_to @article
		else
			render 'edit'#如果想渲染同个控制器中的其他模板，可以把视图的名字传递给 render 方法：
			#    render :edit  #如果不想用字符串，还可使用 Symbol 指定要渲染的动作：
			#render "products/show" #渲染其他控制器中的动作模板
		end

	end

	def destroy
		@article=Article.find(params[:id])
		@article.destroy

		redirect_to articles_path

	end

	private  #below method all is private
	def article_params
	    #看到 permit 方法了吗？这个方法允许在动作中使用 title 和 text 属性。
	    params.require(:article).permit(:title, :text)
	end

=begin
	Rails 路由全解
 http://guides.ruby-china.org/routing.html


	http://guides.ruby-china.org/layouts_and_rendering.html
 使用局部视图去掉视图中的重复代码
编辑文章页面和新建文章页面很相似，显示表单的代码是相同的。下面使用局部视图去掉两个视图中的重复代码。按照约定，局部视图的文件名以下划线开头	

=end


end
