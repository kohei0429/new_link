class ApplicationController < ActionController::Base
#全てのコントローラーは、ApplicationControllerの処理を受け継ぐ

  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action, メソッドの各アクションの事前処理(優先)呼び出し
  #if, で処理対象をdevise_controllerのアクションに限定



  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profire])
    #sign_upに対して自身で追加したキー、name, profireの許可
  end
end
