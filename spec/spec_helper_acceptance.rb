# frozen_string_literal: true

require 'puppet_litmus'
require 'singleton'
require 'spec_helper_acceptance_local' if File.file?(File.join(File.dirname(__FILE__),
                                                               'spec_helper_acceptance_local.rb'))

class Helper
  include Singleton
  include PuppetLitmus
end

PuppetLitmus.configure!
