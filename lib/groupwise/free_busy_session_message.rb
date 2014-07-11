module Groupwise
  class FreeBusySessionMessage
    def initialize(email_addresses, start_time = nil, end_time = nil)
      @email_addresses = email_addresses.is_a?(Array) ? email_addresses : [email_addresses]
      @start_time, @end_time = start_time, end_time
    end

    def to_s
      builder = Builder::XmlMarkup.new

      builder.users { |b|
        @email_addresses.each do |email|
          b.user { |u| u.email(email) }
        end
      }
      builder.startDate(@start_time.utc.iso8601) if @start_time
      builder.endDate(@end_time.utc.iso8601) if @end_time

      builder
    end
  end
end
