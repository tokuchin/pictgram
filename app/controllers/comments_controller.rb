class CommentsController < ApplicationController
  def new
    @topic_id = params[:topic_id]
    @comment = Comment.new
    #new画面に遷移した時に、topic_id = ?(中身はtopic.id) がクエリで引き継がれる。
    #このままでは投稿を押した後までは引き継がれないので、一旦、@topic_idというグローバル変数にする。@を付けることで、Viewに引き継ぐことが出来る。
  end
  
  def create
    #@topic = Topic.find(comment_params[:topic_id])
    @comment = current_user.comments.new(comment_params) 
    #form_forで、commentの中身として、descriptionと、topic_id（中身は@topic_id）が引き継がれてくる。user_idはcurrent_user.idから取ってこれる。
    #下記の２行でも良い。
    #@comment = Comment.new(comment_params)
    #@comment.user_id = current_user.id
    
    #@comment = topic.current_user.comments.new(topic_id: comment_params[:topic_id], description: comment_params[:description]) は、
    #topic.current_user.comments.newという使い方がだめだった
    
    if @comment.save
      redirect_to topics_path, success: 'コメント投稿に成功しました'
    else
      redirect_to topics_path, danger: 'コメント投稿に失敗しました'
      #binding pry
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:topic_id, :description)
    #topic_idをparamsとして受け取る時、strongパラメータに設定していないと値は来ていても受け取れない。
  end
  
end
