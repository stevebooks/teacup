module Teacup
  module_function
  def calculate(view, dimension, amount)
    if amount.is_a? Proc
      view.instance_exec(&amount)
    elsif amount.is_a?(String) && amount.include?('%')
      location = amount.index '%'
      offset = amount[(location+1)..-1].gsub(' ', '').to_f
      percent = amount[0...location].to_f / 100.0

      case dimension
      when :width
        CGRectGetWidth(view.superview.bounds) * percent + offset
      when :height
        CGRectGetHeight(view.superview.bounds) * percent + offset
      else
        raise "Unknown dimension #{dimension}"
      end
    else
      amount
    end
  end
end
