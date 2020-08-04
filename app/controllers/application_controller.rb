class ApplicationController < ActionController::Base
    
	def after_sign_in_path_for(resource)#ログイン後のpassを指定
		if customer_signed_in?#会員ならば
    	   public_customer_path(resource)
    	else
    	   admin_questions_path#管理者ならば
        end
    end

    def after_sign_out_path_for(resource)
		root_path(resource)
	end
end
