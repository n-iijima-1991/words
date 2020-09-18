class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(id: :desc)
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Projectを登録しました'
      redirect_to projects_path
    else
      flash.now[:danger] = 'Projectの登録に失敗しました'
      render :new
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    
    if @project.update(project_params)
      flash[:success] = 'Projectはに更新されました'
      redirect_to project_path
    else
      flash.now[:danger] = 'Prejectの更新に失敗しました'
      render :edit
    end
  end
  
  private

  def project_params
    params.require(:project).permit(:name, :customer, :output, :literature_id)
  end
end
