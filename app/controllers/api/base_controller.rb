class Api::BaseController < ApplicationController
  respond_to :json

  extend Ranking::ErrorHandling
  define_handle_exception_methods
  handle_as_internal_server_error Exception,
    error_code: Ranking::Error::CODES[:unknown]
  handle_as_internal_server_error Ranking::Error::API::Common::
    RequestAuthenticationFailed, error_code: Ranking::Error::CODES[:bad_request]
  handle_as_internal_server_error Ranking::Error::API::Common::
    IsUnderMaintenance,
    error_code: Ranking::Error::CODES[:system_under_maintenance]
  handle_as_internal_server_error Ranking::Error::API::Common::BannedUser,
    error_code: Ranking::Error::CODES[:banned_user]
  handle_as_internal_server_error Ranking::Error::API::Common::MandatoryUpdate,
    error_code: Ranking::Error::CODES[:mandatory_update]
end
