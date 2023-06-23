require_relative 'base-deco'

class CapitalizeDecorator < BaseDeco
  def correct_name
    super.capitalize
  end
end