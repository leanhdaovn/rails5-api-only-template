module Api
  module V1
    class UsersController < ApiController
      before_filter :authenticate_request!
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /api/v1/users
      def index
        users = User.all
        render json: users
      end

      # GET /api/v1/users/1
      def show
        render json: @user
      end

      # POST /api/v1/users
      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created, location: @api_v1_user
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/1
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1
      def destroy
        @user.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        begin
          @user = User.find(params[:id])
        rescue
          user = User.new
          user.errors.add(:id, 'Wrong id provided')
          render_error(user, 400) and return
        end
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :password)
      end
    end
  end
end
