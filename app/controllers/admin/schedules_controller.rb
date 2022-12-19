# google_calendarの設定
# Initialize the client & Google+ APIrequire "google/apis/calendar_v3"

class Admin::SchedulesController < ApplicationController
  
  before_action :authenticate_admin!
  before_action :set_schedule, only: [:show, :destroy, :edit, :update]

  
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
  end
  
  def destroy
    @schedule.destroy
    redirect_to admin_schedules_path
  end
  
  def edit
  end
  
  def update
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
  
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
  
end