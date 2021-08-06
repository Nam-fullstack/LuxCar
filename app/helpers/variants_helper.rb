module VariantsHelper
  def update_name
    year = Year.find(params[:variant][:year_id]).year
    make = Make.find(params[:variant][:make_id]).name
    model = Model.find(params[:variant][:model_id]).name
    door = Door.find(params[:variant][:door_id]).name
    body = BodyType.find(params[:variant][:body_type_id]).name
    speed = Speed.find(params[:variant][:speed_id]).name
    trans = Transmission.find(params[:variant][:transmission_id]).name
    engine = Engine.find(params[:variant][:engine_id]).name
    drive = DriveType.find(params[:variant][:drive_type_id]).name
    fuel = Fuel.find(params[:variant][:fuel_id]).name

    Variant.last.update(name: "#{year} #{make} #{model} #{door}dr #{body} #{speed}-sp #{trans} #{engine} #{drive} #{fuel}")
    puts "THIS IS THE NAME: #{Variant.last.name}"
  end
end
