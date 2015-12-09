class ForumController < ApplicationController
	def index
		@category = Category.all
	end

	def subcategory
		@sub_category = SubCategory.where(:category_id_id => params[:id])
		@topic = Topic.where("cat_id = ? AND subcat_id = ?", params[:id], 0)
	end

	def lstSub
		@subcat = SubCategory.find(params[:id_sub])
		@topic = Topic.where("cat_id = ? AND subcat_id = ?", params[:id], params[:id_sub])
	end

	def newtopic
		@topic = Topic.new
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(cate_params)
			redirect_to forum_path, :notice => t("topicup")
		else
			render 'edit'
		end
	end

	def savetopic
		@topic = Topic.new(topic_params)
		@topic.cat_id = params[:id]
		@topic.subcat_id = params[:id_sub]
		@topic.user_id = session[:user_id]
		if @topic.save
			redirect_to forum_path, :notice => t("topicse")
		else
			render 'newtopic'
		end
	end

	def create
		@category = Category.new(cate_params)
		if @category.save
			redirect_to forum_path, :notice => t("topicse")
		else
			render 'new'
		end
	end
	def new
		@category = Category.new
	end

	def createsub
		@SubCategory = SubCategory.new(subcate_params)
		@SubCategory.category_id_id = params[:id]
		if @SubCategory.save
			redirect_to forum_path, :notice => t("topicse")
		else
			render 'newsub'
		end
	end
	def newsub
		@SubCategory = SubCategory.new		
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to forum_path, :notice => t("topicde")
	end

	def editsub
		@subcategory = SubCategory.find(params[:id_sub])
	end

	def destroysub
		@category = SubCategory.find(params[:id_sub])
		@category.destroy
		redirect_to forum_path, :notice => t("topicde")
	end
	def updatesub
		@subcategory = SubCategory.find(params[:id_sub])
		if @subcategory.update(subcate_params)
			redirect_to forum_path, :notice => t("topicup")
		else
			render 'editsub'
		end
	end
	private
	def topic_params
      params.require(:topic).permit(:title, :texte)
    end
    def cate_params
      params.require(:category).permit(:title, :desc)
    end
     def subcate_params
      params.require(:sub_category).permit(:title, :desc)
    end
end
