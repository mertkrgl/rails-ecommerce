class Product < ApplicationRecord
  validate :name_check
  validate :description_check
  validate :price_check
 

  def name_check
    if name.empty?
      errors.add(:name, "Ürün adı boş bırakılamaz.")
    end
    

    if name[0] != name[0].upcase
      errors.add(:name, "Ürün adı büyük harf ile başlamalıdır.")
    end

  end

  
  def description_check
    if description.empty?
      errors.add(:description, "Ürün açıklaması boş bırakılamaz.")
    end

    if description.length > 50
      errors.add(:description, "Ürün açıklaması 50 harfi geçmemelidir.")
    end

    if description[0] != description[0].upcase
      errors.add(:description, "Ürün açıklaması büyük harf ile başlamalıdır.")
    end

  end

  
  def price_check
    if price.blank?
      errors.add(:price, "Ürün fiyatı boş bırakılamaz.")
    end

    if price.present? && price <= 0
      errors.add(:price, "Ürün fiyatı 0'dan büyük olmalıdır.")
    end

    if price.present? && price > 100000
      errors.add(:price, "Ürün fiyatı 100.000₺'den fazla olamaz.")
    end
    
  end

end
