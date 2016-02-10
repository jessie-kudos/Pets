require 'rspec/expectations'

module PunditMatchers
  extend RSpec::Matchers::DSL

  matcher :permit do |action|
    match do |policy|
      policy.public_send("#{action}?")
    end

    failure_message do |policy|
      "expected #{policy.class} to permit #{action} on #{policy.record} for #{policy.user.inspect}"
    end

    failure_message_when_negated do |policy|
      "expected #{policy.class} to forbid #{action} on #{policy.record} for #{policy.user.inspect}"
    end
  end
end
