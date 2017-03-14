class Array
  def my_flatten
    result = []
    # Initial result is an empty array, we're using tap here
    # to return final value of `result` variable
    result.tap do
      self.each do |element|
        # If we find an Array then call `my_flatten` recursivelly
        if element.class == Array
          element.my_flatten.each do |sub_element|
            result << sub_element
          end
        else
          result << element
        end
      end
    end
  end
end
