class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
#TODOS OS METODOS AQ PRESENTES TBM PERTENCEM AOS OUTROS CONTROLLERS DO APP  
# As linhas a seguir sao responsaveis por barrar usuario caso ele n seja logado. Redireciona ao login
    helper_method :current_user 

 	def current_user 
 	  @current_user ||= User.find(session[:user_id]) if session[:user_id] 
 	end
	
 	def require_user 
 	  redirect_to welcome_path unless current_user 
 	end
  
end
