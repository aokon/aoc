# frozen_string_literal: true

require "bundler"
require "zeitwerk"

module Aoc
  def self.loader
    @loader ||= begin
      loader = Zeitwerk::Loader.new
      loader.tag = "aoc"
      loader.push_dir(__dir__)
      loader
    end
  end

  def self.setup_dependencies
    Bundler.require(:default)
  end

  def self.boot
    loader.setup
    setup_dependencies
  end
end

Aoc.boot
