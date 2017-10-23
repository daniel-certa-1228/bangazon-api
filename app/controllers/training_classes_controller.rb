class TrainingClassesController < ApplicationController

  def index
    @training_classes = TrainingClass.all
    json_response(@training_classes)
  end

  def show
    @training_classes = TrainingClass.find(params[:id])
    json_response(@training_classes)
  end

  def create
    @training_classes = TrainingClass.create(training_classes_params)
    json_response(@training_classes)
  end

  def update
    @training_classes = TrainingClass.find(params[:id])
    @training_classes.update(training_classes_params)
    json_response(@training_classes)
  end

  def destroy
    @training_classes = TrainingClass.find(params[:id])
    if Date.parse(:start_date) < Date.today
      @training_classes.destroy
    end
  end

  private

  def training_classes_params
    params.require(:training_classes).permit(:class_name, :start_date, :end_date, :max_seats)
  end

end