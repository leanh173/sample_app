module Ranking::Error
  CODES = {
    unknown: 600,
    bad_request: 601,
    invalid_sns_access: 602,
    unsupported_region: 603,
    user_update_failed: 604,
    campaign_reserve_failed: 605,
    campaign_issue_failed: 606,
    installed_package_not_found: 607,
    notice_read_failed: 608,
    banned_user: 609,
    invalid_country: 610,
    invalid_campaign: 611,
    invalid_device: 612,
    device_sign_up_once: 613,
    invalid_article: 614,
    system_under_maintenance: 666,
    mandatory_update: 696,
  }

  class Base < ::Exception
    def initialize *args
      if args.length == 0
        t_key = self.class.name.underscore.gsub(/\//, ".")
        super I18n.t(t_key)
      else
        super *args
      end
    end
  end

  module API
    module Common
      class Unknown < Ranking::Error::Base
      end
      class RequestAuthenticationFailed < Ranking::Error::Base
      end
      class IsUnderMaintenance < Ranking::Error::Base
      end
      class BannedUser < Ranking::Error::Base
      end
      class MandatoryUpdate < Ranking::Error::Base
      end
      class InvalidDevice < Ranking::Error::Base
      end
      class DeviceSignUpOnce < Ranking::Error::Base
      end
    end
    module Sns
      class InvalidAccess < Ranking::Error::Base
      end
      class UnsupportedRegion < Ranking::Error::Base
      end
    end
    module User
      class UpdateFailed < Ranking::Error::Base
      end
    end
    module Campaign
      class PreLaunchReserveFailed < Ranking::Error::Base
      end
      class LaunchedReserveFailed < Ranking::Error::Base
      end
      class IssueFailed < Ranking::Error::Base
      end
      class CommentFailed < Ranking::Error::Base
      end
      class LoadFailed < Ranking::Error::Base
      end
      class InvalidCountry < Ranking::Error::Base
      end
      class Invalid < Ranking::Error::Base
      end
      class PreLaunchReserveReleased < Ranking::Error::Base
      end
    end
    module App
      class PackageNotFound < Ranking::Error::Base
      end
    end
    module Notice
      class ReadFailed < Ranking::Error::Base
      end
    end
    module Article
      class LoadFailed < Ranking::Error::Base
      end
    end
  end
end
