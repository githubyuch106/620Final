class MemberController < ApplicationController
  
  
  def login
  end

  def login_post
    if((params[:email] == "admin@admin.com" && params[:password] == "admin") ||(params[:email] == "yx650650@sju.edu" && params[:password] == "123"))
      redirect_to :controller => 'admin', :action => 'dashboard'
    else

      @member = Member.where(:email=>params[:email],:password=>params[:password]).first
      
      if @member.nil?
        respond_to do |format|   
          msg = { :status => 0, :message => "Fail!", :html => "<b>...</b>" }
            format.json  { render :json => msg }
            session[:member] = ""
            session[:member_id] = ""
        end    
      else
        respond_to do |format|   
          msg = { :status => 1, :message => "success!", :html => "<b>...</b>" }
            format.json  { render :json => msg }
            session[:member] = @member.first_name + " " + @member.last_name
            session[:member_id] = @member.id
        end
      end 
    end   
  end
  

  def register  	
  end

  def register_post
  	@member = Member.new
  	@member.first_name = params[:first_name]
  	@member.last_name = params[:last_name]
  	@member.email = params[:email]
  	@member.password = params[:password]
  	@member.phone = params[:contact]
  	@member.address = params[:address]


	if @member.save
		flash[:notice] = "Member created Successfully"
		respond_to do |format|
    		msg = { :status => 1, :message => "Success!", :html => "<b>...</b>" }
    		format.json  { render :json => msg } 
    		session[:member] = @member.first_name + " " + @member.last_name
        session[:member_id] = @member.id
  		end
	else
		respond_to do |format|
    		msg = { :status => 0, :message => "Success!", :html => "<b>...</b>" }
    		format.json  { render :json => msg } 
  		end
	end
  end

  def logout
    session[:member] = ""
    session[:member_id] = ""
    redirect_to :controller => 'member', :action => 'login'

  end




  

end
