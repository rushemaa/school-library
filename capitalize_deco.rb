require_relative 'base_deco'

class CapitalizeDecorator < BaseDeco
  def correct_name
    super.capitalize
  end
end
