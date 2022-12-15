# google_calendarの設定
# Initialize the client & Google+ APIrequire "google/apis/calendar_v3"

class Admin::SchedulesController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.admin_id = current_admin.id
    @schedule.save
    redirect_to admin_schedules_path
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to admin_schedules_path
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to admin_schedule_path(@schedule.id)
    else
      flash.now[:alart] = "必須項目を入力してください。"
      render :edit
    end
  end
  
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:title, :body, :start_time)
  end
  
end