require 'sprockets/jst_processor'

module Jasmine::Headless
  class JSTTemplate < Sprockets::JstProcessor
    self.default_mime_type = 'application/javascript'

    include Jasmine::Headless::FileChecker
    def evaluate(*args)
      if bad_format?(file)
        alert_bad_format(file)
        return ''
      end
      %{<script type="text/javascript">#{super}</script>}
    end
  end
end

