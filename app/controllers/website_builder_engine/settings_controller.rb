module WebsiteBuilderEngine
  class SettingsController < ApplicationController

    before_filter :get_settings, :only => [:publish]

    def publish
      # create (or recreate) the welcome page
      @articles = Article.where(published: true)
      @welcome_sidebar = RedCloth.new(@settings.sidebar).to_html.html_safe if @settings.sidebar
      @welcome_intro = RedCloth.new(@settings.about).to_html.html_safe if @settings.about
      welcome_page = render_to_string(:template => "website_builder_engine/templates/homepage.html.haml", :layout => false )
      File.open("#{@docroot_path}index.html", 'w') {|f| f.write(welcome_page) }
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Updated home page." }
      end

    end

    # GET /settings/1
    # GET /settings/1.json
    def show
      @setting = Setting.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @setting }
      end
    end

    # GET /settings/new
    # GET /settings/new.json
    def new
      @setting = Setting.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @setting }
      end
    end

    # GET /settings/1/edit
    def edit
      @setting = Setting.find(params[:id])
    end

    # POST /settings
    # POST /settings.json
    def create
      @setting = Setting.new(params[:setting])

      respond_to do |format|
        if @setting.save
          format.html { redirect_to @setting, notice: 'Setting was successfully created.' }
          format.json { render json: @setting, status: :created, location: @setting }
        else
          format.html { render action: "new" }
          format.json { render json: @setting.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /settings/1
    # PUT /settings/1.json
    def update
      @setting = Setting.find(params[:id])

      respond_to do |format|
        if @setting.update_attributes(params[:setting])
          format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @setting.errors, status: :unprocessable_entity }
        end
      end
    end

  end
end