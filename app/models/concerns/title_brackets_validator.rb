class TitleBracketsValidator < ActiveModel::Validator
  def validate(title)
    def valid_string?(title)
      strim = title.gsub(/[^\[\]\(\)\{\}]/,'')
      return true if strim.empty?
      return false if strim.size.odd?
      loop do  
        s = strim.gsub('()','').gsub('[]','').gsub('{}','')
        return true if s.empty?
        return false if s == strim
        strim = s
      end   
    end
  end
end