# frozen_string_literal: true

module ParamsFormatter
  def format_params(params)
    params_array = params.to_a
    new_array = []
    params_array.map do |pair|
      new_array << "#{pair[0]}: #{pair[1]},"
    end
    new_array
  end
end
