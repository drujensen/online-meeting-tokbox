class HomeController < Kemalyst::Controller
  def index 
    html render("home/index.slang", "main.slang")
  end
end
