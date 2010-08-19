class Product < ActiveRecord::Base
    validates_presence_of :title, :description, :image_url
    validates_numericality_of :price
    validate :price_must_be_at_least_a_cent
    validates_uniqueness_of :title
    validates_format_of :image_url,
                        :with    => %r{ \.(gif|jpg|png)$}i,
                        :message => 'はGIF、JPG、PNG画像のURLでなければなりません'




    protected
    def price_must_be_at_least_a_cent
        errors.add(:price, 'は最小でも0.01以上でなければなりません') if price.nil? ||
            price < 0.01
    end
end
