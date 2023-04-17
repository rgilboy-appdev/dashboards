Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get("/forex", {:controller => "forex", :action => "main_page"})

get("/forex/:ticker", {:controller => "exchange", :action => "convert"})

get("/forex/:ticker1/:ticker2", {:controller => "exchange", :action => "calculate"})

end
